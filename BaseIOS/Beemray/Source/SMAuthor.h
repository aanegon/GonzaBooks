//
//  SMAuthor.h
//  GonzaBOOKS
//
//  Created by Simed on 20/4/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Class that represents an author.
 */
@interface SMAuthor : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *lastName;

/**
 *  Designated initializer
 *
 *  @param fullName @p NSString with full name
 *
 *  @return self
 */
- (instancetype)initWithFullName:(NSString *)fullName NS_DESIGNATED_INITIALIZER;

@end
