//
//  PANavigationItemDescriptor.m
//  PassApp
//
//  Created by Alex Anegon on 23/02/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import "PANavigationItemDescriptor.h"

@implementation PANavigationItemDescriptor

/*
 * Class utility method
 */
+ (instancetype)navigationItemDescriptorWithLeftButton:(UIBarButtonItem *)leftButton
                                           rightButton:(UIBarButtonItem *)rightButton
{
    PANavigationItemDescriptor *navigationItemDescriptor = [[PANavigationItemDescriptor alloc] init];

    [navigationItemDescriptor setLeftButton:leftButton];
    [navigationItemDescriptor setRightButton:rightButton];
    [navigationItemDescriptor setThirdPartyOption:PANavigationThirdItemOption_None];
    
    return navigationItemDescriptor;
}

@end
