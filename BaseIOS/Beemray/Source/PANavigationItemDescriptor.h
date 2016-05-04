//
//  PANavigationItemDescriptor.h
//  PassApp
//
//  Created by Alex Anegon on 23/02/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  Enum to know if we must show a third @p UIBarbutton item or not.
 */
typedef NS_ENUM(NSUInteger, PANavigationThirdItemOption) {
    /**
     *  Create Calendar button.
     */
    PANavigationThirdItemOption_Calendar,
    /**
     *  Create Search button.
     */
    PANavigationThirdItemOption_Search,
    /**
     *  None.
     */
    PANavigationThirdItemOption_None
};

@interface PANavigationItemDescriptor : NSObject

/**
 * The left button.
 */
@property (nonatomic, readwrite, strong) UIBarButtonItem *leftButton;

/**
 * The right button.
 */
@property (nonatomic, readwrite, strong) UIBarButtonItem *rightButton;

/**
 *  The third party option.
 */
@property (nonatomic, readwrite) PANavigationThirdItemOption thirdPartyOption;

/**
 *  Class utility method.
 *
 *  @param leftButton  The left button.
 *  @param rightButton The right button.
 *
 *  @return a @p PANavigationItemDescriptor instance.
 */
+ (instancetype)navigationItemDescriptorWithLeftButton:(UIBarButtonItem *)leftButton
                                           rightButton:(UIBarButtonItem *)rightButton;

@end
