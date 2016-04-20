//
//  SMRequestFactory.h
//  GonzaBOOKS
//
//  Created by Simed on 20/4/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Creates all the possible requests that interacts with servers.
 */
@interface SMRequestFactory : NSObject

/**
 *  Request to download the books
 *
 *  @param text Text to search the books
 *
 *  @return @p NSURLRequest object 
 */
+ (NSURLRequest *)searchItemsWithText:(NSString *)text;

@end
