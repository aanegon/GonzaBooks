//
//  SMBookDetailsViewController.h
//  GonzaBOOKS
//
//  Created by Simed on 28/4/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PABaseViewController.h"

@class SMBook;

@interface SMBookDetailsViewController : PABaseViewController

@property (nonatomic, strong) SMBook *book;

@end
