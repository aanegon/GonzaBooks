//
//  SMImage.h
//  GonzaBOOKS
//
//  Created by Simed on 20/4/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Class that Represents one Image
 */
@interface SMImage : NSObject

@property (nonatomic, readonly) NSString *small;
@property (nonatomic, readonly) NSString *normal;

/**
 *  Designated initializer
 *
 *  @param dictionary images
 *
 *  @return self
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary NS_DESIGNATED_INITIALIZER;

@end

