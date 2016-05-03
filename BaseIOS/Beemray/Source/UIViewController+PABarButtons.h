//
//  UIViewController+PABarButtons.h
//  PassApp
//
//  Created by Alex Anegon on 23/02/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (PABarButtons)

/**
 *  Creates the menu button to show the lateral menu
 *
 *  @param action sets the selector for the UIControlEventTouchUpInside event.
 *
 *  @return a bar button for @p UINavigationItem
 */
- (UIBarButtonItem *)getGoMenuButton:(SEL)action;

/**
 *  Creates the go back menu button so we can go to previous controller.
 *
 *  @param action sets the selector for the UIControlEventTouchUpInside event.
 *
 *  @return a bar button for @p UINavigationItem
 */
- (UIBarButtonItem *)getGoBackButton:(SEL)action;

/**
 *  Creates the calendar menu button so we can show the calendar.
 *
 *  @param action sets the selector fot the UIControlEventTouchUpInside event.
 *
 *  @return a bar button for @p UINavigationItem
 */
- (UIBarButtonItem *)getCalendarButton:(SEL)action;

/**
 *  Creates the search menu button.
 *
 *  @param action sets the selector fot the UIControlEventTouchUpInside event.
 *
 *  @return a bar button for @p UINavigationItem
 */
- (UIBarButtonItem *)getSearchButton:(SEL)action;

/**
 *  Creates a button following parameter text
 *
 *  @param text   setx the title of the button
 *  @param action sets the selector for the UICOntrolEventTouchUpInside event.
 *
 *  @return a bar button item for @p UINavigationItem
 */
- (UIBarButtonItem *)getButtonWithText:(NSString *)text action:(SEL)action;

@end
