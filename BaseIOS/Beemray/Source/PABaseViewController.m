//
//  PABaseViewController.m
//  PassApp
//
//  Created by Alex Anegon on 23/02/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import "PABaseViewController.h"
#import "PANavigationItemDescriptor.h"
#import "AppDelegate.h"

#import "UIViewController+PABarButtons.h"
#import "NSObject+Abstract.h"

@interface PABaseViewController ()

@property (nonatomic, readwrite) UISwipeGestureRecognizer *swipeGesture;

@end

@implementation PABaseViewController

static CGFloat const kFixedSpaceWidth = 16.0f;

#pragma mark - Public method

- (UIView *)retrieveBusyView {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"SMBusyView"];
    UIActivityIndicatorView *activity;
    for (UIView *view in [[vc view] subviews]) {
        if ([view isKindOfClass:[UIActivityIndicatorView class]]) {
            activity = (UIActivityIndicatorView *)view;
            [activity startAnimating];
            break;
        }
    }
    
    return [vc view];
}

#pragma mark - View life cycle.

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self configureNavigationItem];
}

#pragma mark - Private methods.

/**
 *  We configure the navigation itme with the needed buttons.
 */
- (void)configureNavigationItem {
    UINavigationItem *item = [self navigationItem];
    PANavigationItemDescriptor *descriptor = [self navigationItemDescriptor];

    [item setLeftBarButtonItem:[descriptor leftButton]];

    if (![item leftBarButtonItem]) {
        [item setHidesBackButton:YES];
    }

    NSMutableArray *rightButtons = [NSMutableArray array];
    UIBarButtonItem *rightButton = [descriptor rightButton];

    if (rightButton) {
        [rightButtons addObject:rightButton];
    }

    if ([descriptor thirdPartyOption] != PANavigationThirdItemOption_None) {
        //Serparation between buttons.
        UIBarButtonItem *fixedBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        [fixedBarButtonItem setWidth:kFixedSpaceWidth];
        [rightButtons addObject:fixedBarButtonItem];

        UIBarButtonItem *thirdPartyButton;
        switch ([descriptor thirdPartyOption]) {
            case PANavigationThirdItemOption_Calendar:
                thirdPartyButton = [self getCalendarButton:@selector(showCalendar)];
                break;
            case PANavigationThirdItemOption_Search:
                thirdPartyButton = [self getSearchButton:@selector(showSearch)];
                break;
            case PANavigationThirdItemOption_None:
                break;
        }
        
        if (thirdPartyButton) {
            [rightButtons addObject:thirdPartyButton];
        }
    }

    [item setRightBarButtonItems:rightButtons];
}

/**
 *  Configures and returns the navigation item descriptor.
 *
 *  @return return the item descriptor @p PANavigationItemDescriptor
 */
- (PANavigationItemDescriptor *)navigationItemDescriptor {
    UINavigationController *navigationController = [self navigationController];
    PANavigationItemDescriptor *descriptor = nil;
    
    UIBarButtonItem *rightButtonItem = nil;
    UIBarButtonItem *leftButtonItem = nil;
    
    if (navigationController != nil) {
        leftButtonItem = [self getGoMenuButton:@selector(showLateralMenu)];
        
        descriptor = [PANavigationItemDescriptor navigationItemDescriptorWithLeftButton:leftButtonItem
                                                                            rightButton:rightButtonItem];
    }
    
    return (descriptor ? : [[PANavigationItemDescriptor alloc] init]);
}

/**
 *  Subclass is responisbily of manage this method.
 */
- (void)showLateralMenu {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate showMenu];
}

/**
 *  Subclass is responisbily of manage this method.
 */
- (void)showCalendar {
    [self subclassResponsibility:_cmd];
}

/**
 *  Subclass is responisbily of manage this method.
 */
- (void)showSearch {
    [self subclassResponsibility:_cmd];
}

@end
