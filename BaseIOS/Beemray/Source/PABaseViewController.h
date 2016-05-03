//
//  PABaseViewController.h
//  PassApp
//
//  Created by Alex Anegon on 23/02/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PABaseMenuSwipeControllerDelegate;

@protocol PABaseMenuSwipeControllerDelegate <NSObject>

- (void)baseViewController:(id)controller offset:(CGFloat)offset;

@end

@interface PABaseViewController : UIViewController

@property (weak, nonatomic) id<PABaseMenuSwipeControllerDelegate> delegate;

/**
 *  Retrieve the busy view
 *
 *  @return a busy view @p UIView
 */
- (UIView *)retrieveBusyView;

/**
 *  Show the lateral menu
 */
- (void)showLateralMenu;

/**
 *  Subclass is responisbily of manage this method.
 */
- (void)showCalendar;

/**
 *  Subclass is responisbily of manage this method.
 */
- (void)showSearch;

@end
