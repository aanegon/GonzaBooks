//
//  AppDelegate.m
//  Beemray
//
//  Created by Alex Anegon on 03/02/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import "AppDelegate.h"
#import "PAMenuController.h"
#import "PAMenuCell.h"
#import "SMBook.h"

#import "UIView+Position.h"

static CGFloat const kMoveRootViewControllerX = 256.0;
static NSString * const kMainStoryboardKey = @"Storyboard";

@interface AppDelegate ()

@property (nonatomic, strong) PAMenuController *menuController;
@property (nonatomic, readwrite) CGFloat originalHeight;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    [self installSwipeGestures];
    
    NSString *str = @"4.09";
    NSLog(@"Hola holita: %@", str);
    
    NSString *gonzalo = @"gonzalo";
    gonzalo = [gonzalo uppercaseString];
    
    CGFloat floatNum = [self getNumberFloatValueWithNumber:@"4.09"];
    NSLog(@"Conversion del float: %f", floatNum);
    
    return YES;
}

- (CGFloat)getNumberFloatValueWithNumber:(NSString *)numerito
{
    CGFloat numFLoat;
    
    numFLoat = [numerito floatValue];
    
    return numFLoat;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Menu methods.

- (void)showMenu {
    if (_menuController == nil) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:kMainStoryboardKey bundle:nil];
        _menuController = (PAMenuController *)[storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([PAMenuController class])];
        _originalHeight = CGRectGetHeight(_menuController.view.frame);
    }
    
    [_menuController.tableview reloadData];
    
    //Get the window to get the navigation controlller and add the menu
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    //Add the menu at bottom because we will move the nav controller to see it.
    [window insertSubview:[_menuController view] belowSubview:[[window rootViewController] view]];
    
    //add a button to move the view to the left and show the view controller
    UIButton *hideMenu = [[UIButton alloc] initWithFrame:window.rootViewController.view.frame];
    [hideMenu addTarget:self action:@selector(hideMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    [window.rootViewController.view addSubview:hideMenu];
    [window.rootViewController.view bringSubviewToFront:hideMenu];
    
    [UIView animateWithDuration:0.4 animations:^{
        [[[window rootViewController] view] setFrame:CGRectMake(kMoveRootViewControllerX,
                                                                CGRectGetHeight(_menuController.tableview.tableHeaderView.frame),
                                                                [[[window rootViewController] view] frameWidth],
                                                                [PAMenuCell standardCellHeight]*kNumberOfMenuItems)];
    }];
}

//- (void)installSwipeGestures {
//    UIPanGestureRecognizer *pG = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
//    [pG setMaximumNumberOfTouches:1];
//    [pG setMinimumNumberOfTouches:1];
//    
//    [_window addGestureRecognizer:pG];
//}

/**
 *  To retrieve the value of the swipe gesture
 *
 *  @param sender The @p UIPanGestureRecognizer
 */
//- (void)swipeGesture:(id)sender {
//    UIPanGestureRecognizer *pg = (UIPanGestureRecognizer *)sender;
//    CGFloat pointX = [pg translationInView:_window].x;
//    
//    if (pointX > 0) {
//        //Open Menu
//        [self showMenuWithPointX:pointX];
//    } else {
//        //Close Menu
//    }
//}
//
//- (void) showMenu {
//    if (_menuController == nil) {
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:kMainStoryboardKey bundle:nil];
//        _menuController = (PAMenuController *)[storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([PAMenuController class])];
//        _originalHeight = CGRectGetHeight(_menuController.view.frame);
//    }
//    
//    [_menuController.tableview reloadData];
//    
//    //Get the window to get the navigation controlller and add the menu
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    //Add the menu at bottom because we will move the nav controller to see it.
//    [window insertSubview:[_menuController view] belowSubview:[[window rootViewController] view]];
//    
//    //add a button to move the view to the left and show the view controller
//    UIButton *hideMenu = [[UIButton alloc] initWithFrame:window.rootViewController.view.frame];
//    [hideMenu addTarget:self action:@selector(hideMenu:) forControlEvents:UIControlEventTouchUpInside];
//    
//    [window.rootViewController.view addSubview:hideMenu];
//    [window.rootViewController.view bringSubviewToFront:hideMenu];
//    
//    if ([window.rootViewController isKindOfClass:[PABaseViewController class]]) {
//        PABaseViewController *baseVC = (PABaseViewController *)window.rootViewController;
//        baseVC.delegate = self;
//    }
//}
//
//- (void)showMenuWithPointX:(CGFloat)pointX {
//    
//    [self showMenu];
//    
//    if (pointX >= kMoveRootViewControllerX) {
//        pointX = kMoveRootViewControllerX;
//    }
//    
//    
//    CGFloat pointYFinal = [PAMenuCell standardCellHeight]*kNumberOfMenuItems;
//    CGFloat pointY = _originalHeight - pointX;
//    
//    if (pointY <= pointYFinal) {
//        pointY = pointYFinal;
//    }
//    
//    
//    CGFloat pointHFinal = CGRectGetHeight(_menuController.tableview.tableHeaderView.frame);
//    CGFloat pointH = pointX;
//    if (pointH <= CGRectGetHeight(_menuController.tableview.tableHeaderView.frame)) {
//        pointH = pointHFinal;
//    }
//    
//    NSLog(@"%f", pointH);
//    
////    [UIView animateWithDuration:0.01 animations:^{
//        [[[_window rootViewController] view] setFrame:CGRectMake(pointX,
//                                                                pointH,
//                                                                [[[_window rootViewController] view] frameWidth],
//                                                                pointY)];
////    }];
//}

- (void)hideMenu:(id)sender {
    //Get the window to get the nav and put it at the front
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIButton *hideMenu = (UIButton *)sender;
    
    [UIView animateWithDuration:0.4 animations:^{
        CGRect originalFrame = CGRectMake(0.0f,
                                          0.0f,
                                          [[[window rootViewController] view] frameWidth],
                                          _originalHeight);
        [[[window rootViewController] view] setFrame:originalFrame];
        [hideMenu removeFromSuperview];
    }];
}


@end
