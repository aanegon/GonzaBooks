//
//  SMGoogleWSManager.m
//  GonzaBOOKS
//
//  Created by Simed on 20/4/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import "SMGoogleWSManager.h"
#import "SMRequestFactory.h"
#import "SMBook.h"

static NSString * const kWSItems = @"items";
static NSString * const kWSVolumeInfo = @"volumeInfo";

@interface SMGoogleWSManager ()

/**
 *  The queue for all async peticions.
 */
@property (nonatomic, readonly) dispatch_queue_t queue;

@end

@implementation SMGoogleWSManager

#pragma mark - Private methods

- (instancetype)initPrivately {
    self = [super init];
    
    if (self != nil) {
        _queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    }
    
    return self;
}

#pragma mark - Public methods

- (void)getItemsWithSearch:(NSString *)search
              successBlock:(void (^)(NSArray *))successBlock
                errorBlock:(void (^)(NSError *))errorBlock
{
    dispatch_async(_queue, ^{
        
        NSURLRequest *request = [SMRequestFactory searchItemsWithText:search];
        NSURLResponse *response = nil;
        NSError *error = nil;
        
        NSData *serverData = [NSURLConnection sendSynchronousRequest:request
                                                   returningResponse:&response
                                                               error:&error];
        if (![response isKindOfClass:[NSHTTPURLResponse class]] ||
            [(NSHTTPURLResponse *)response statusCode] != 200 ||
            error != nil)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (errorBlock != nil) {
                    errorBlock(error);
                }
            });
            return;
        }
        
        NSDictionary *jsonServer = [NSJSONSerialization JSONObjectWithData:serverData options:0 error:&error];
        NSArray *items = [NSArray arrayWithArray:(NSArray *)jsonServer[kWSItems]];
        NSMutableArray *books = [NSMutableArray arrayWithCapacity:[items count]];
        for (NSDictionary *dict in items) {
            SMBook *book = [[SMBook alloc] initWithDictionary:dict[kWSVolumeInfo]];
            [books addObject:book];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (successBlock != nil) {
                successBlock(books);
            }
        });
        
    });
}

- (void)getBookImageWithURL:(NSURL *)imageURL completionBlock:(void (^)(UIImage *))completionBlock {
    dispatch_async(_queue, ^{
        NSURLRequest *request = [SMRequestFactory imageWithURL:imageURL];
        NSURLResponse *response = nil;
        NSError *error = nil;
        
        NSData *serverData = [NSURLConnection sendSynchronousRequest:request
                                                   returningResponse:&response
                                                               error:&error];
        if (![response isKindOfClass:[NSHTTPURLResponse class]] ||
            [(NSHTTPURLResponse *)response statusCode] != 200 ||
            error != nil)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completionBlock != nil) {
                    completionBlock(nil);
                }
            });
            return;
        }
        
        __block UIImage *resultImage = [UIImage imageWithData:serverData];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completionBlock != nil) {
                completionBlock(resultImage);
            }
        });
        return;
    });
}

#pragma mark - NSObject Methods

+ (SMGoogleWSManager *)sharedInstance {
    static dispatch_once_t pred = 0;
    static SMGoogleWSManager * SINGLETON = nil;
    
    dispatch_once(&pred, ^{
        SINGLETON = [[SMGoogleWSManager alloc] initPrivately];
    });
    
    return SINGLETON;
}

@end
