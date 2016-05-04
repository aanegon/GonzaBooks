//
//  SMGoogleWSManager.h
//  GonzaBOOKS
//
//  Created by Simed on 20/4/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import <Foundation/Foundation.h>

@import UIKit;

/**
 *  Singleton that manages google web services.
 */
@interface SMGoogleWSManager : NSObject

/**
 *  The only intance of the Google manger is share
 *
 *  @return self
 */
+ (SMGoogleWSManager *)sharedInstance;

/**
 *  Retrieve all the items following user search
 *
 *  @param search       search terms
 *  @param successBlock success completion block with an array of @p SMBook
 *  @param erroBlock    error completion block with NSError
 */
- (void)getItemsWithSearch:(NSString *)search
              successBlock:(void(^)(NSArray *items))successBlock
                errorBlock:(void(^)(NSError *error))errorBlock;

/**
 *  Retrieve the image following the URL, if the server returns no image we too.
 *
 *  @param imageURL        @p NSURL thta represents the image
 *  @param completionBlock completion block that returns an @p UIImage
 */
- (void)getBookImageWithURL:(NSURL *)imageURL completionBlock:(void(^)(UIImage *image))completionBlock;

@end
