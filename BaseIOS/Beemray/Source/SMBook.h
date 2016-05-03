//
//  SMBook.h
//  GonzaBOOKS
//
//  Created by Simed on 19/4/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SMImage;

/**
 *  Represents a book
 */
@interface SMBook : NSObject

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *bookDescription;
@property (nonatomic, readonly) NSNumber *averageRating;
@property (nonatomic, readonly) NSArray *authors;
@property (nonatomic, readonly) SMImage *images;

/**
 *  Desiganted Initializer
 *
 *  @param dictionary Books JSON representation.
 *
 *  @return self
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary NS_DESIGNATED_INITIALIZER;

@end
