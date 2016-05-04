//
//  PABaseViewController+Protected.h
//  PassApp
//
//  Created by Alex Anegon on 23/02/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import "PABaseViewController.h"
#import "PANavigationItemDescriptor.h"

@interface PABaseViewController (Protected)

/**
 * Configures and returns the navigation item descriptor.
 *
 * @return A NavigationItemDescriptor instance.
 * @protected
 */
- (PANavigationItemDescriptor *)navigationItemDescriptor __attribute__((objc_requires_super));

@end
