//
//  SMBook.m
//  GonzaBOOKS
//
//  Created by Simed on 19/4/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import "SMBook.h"
#import "SMAuthor.h"
#import "SMImage.h"

static NSString * const kBookWsTitle = @"title";
static NSString * const kBookWsDescription = @"description";
static NSString * const kBookWsAverageRating = @"averageRating";
static NSString * const kBookWsAuthors = @"authors";
static NSString * const kBookWsImages = @"imageLinks";

@interface SMBook ()

@property (nonatomic, readwrite) NSString *title;
@property (nonatomic, readwrite) NSString *bookDescription;
@property (nonatomic, readwrite) NSNumber *averageRating;

/**
 *  An array of @p SMAuthor
 */
@property (nonatomic, readwrite) NSArray *authors;
@property (nonatomic, readwrite) SMImage *images;

@end

@implementation SMBook

#pragma mark - Initializers

- (instancetype)init {
    return [self initWithDictionary:nil];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self != nil) {
        _title = dictionary[kBookWsTitle];
        _bookDescription = dictionary[kBookWsDescription];
        _averageRating = dictionary[kBookWsAverageRating];
        
        NSArray *dictAuthors = [NSArray arrayWithArray:dictionary[kBookWsAuthors]];
        NSMutableArray *newAuthors = [NSMutableArray arrayWithCapacity:[dictAuthors count]];
        
        for (NSString *author in dictAuthors) {
            SMAuthor *newAuthor = [[SMAuthor alloc] initWithFullName:author];
            [newAuthors addObject:newAuthor];
        }
        
        _authors = [NSArray arrayWithArray:newAuthors];
        
        _images = [[SMImage alloc] initWithDictionary:dictionary[kBookWsImages]];
    }
    
    return self;
}

#pragma mark - Public methods

- (NSString *)description {
   return [NSString stringWithFormat:@"Titulo: %@ \n Autores: %@ \n %@ \n AverageRating: %@", _title, _authors, _bookDescription, _averageRating];
}

@end
