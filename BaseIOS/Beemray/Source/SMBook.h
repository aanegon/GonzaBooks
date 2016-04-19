//
//  SMBook.h
//  GonzaBOOKS
//
//  Created by Simed on 19/4/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Represents a book
 */
@interface SMBook : NSObject

/**
 *  Desiganted Initializer
 *
 *  @param dictionary Books JSON representation.
 *
 *  @return self
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
