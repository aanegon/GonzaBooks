//
//  PAMenuController.h
//  PassApp
//
//  Created by Alex Anegon on 23/02/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSUInteger const kNumberOfMenuItems;

/**
 *  Here we will manage all the menu.
 */
@interface PAMenuController : UIViewController

@property (nonatomic, strong) IBOutlet UITableView *tableview;

@end
