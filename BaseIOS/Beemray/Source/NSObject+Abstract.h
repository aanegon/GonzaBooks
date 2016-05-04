//
//  NSObject+Abstract.h
//  PassApp
//
//  Created by Alex Anegon on 23/02/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Abstract)

/**
*  Message sent when an implementation wants to explicity require a subclass to implement a method.
*/
- (id)subclassResponsibility:(SEL)aSel;

@end
