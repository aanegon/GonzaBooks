//
//  NSObject+Abstract.m
//  PassApp
//
//  Created by Alex Anegon on 23/02/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import "NSObject+Abstract.h"
#import <objc/runtime.h>

@implementation NSObject (Abstract)

- (id)subclassResponsibility:(SEL)aSel {
    char c = (class_isMetaClass(object_getClass(self)) ? '+' : '-');

    [NSException raise:NSInvalidArgumentException
                format:@"[%@%c%@] should be overridden by subclass",
     NSStringFromClass([self class]), c,
     aSel ? (id)NSStringFromSelector(aSel) : (id)@"(null)"];
    return self;        // Not reached
}

@end
