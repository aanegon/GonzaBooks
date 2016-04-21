//
//  ViewController.m
//  Beemray
//
//  Created by Alex Anegon on 03/02/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import "ViewController.h"
#import "PANavigationItemDescriptor.h"
#import "SMGoogleWSManager.h"

#import "PABaseViewController+Protected.h"
#import "UIViewController+PABarButtons.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[SMGoogleWSManager sharedInstance] getBookImageWithURL:[NSURL URLWithString:@"http://books.google.es/books/content?id=hper1VsSlTkC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"] completionBlock:^(UIImage *image) {
        [_imageView setImage:image];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NavigationDescriptor methods.

//- (PANavigationItemDescriptor *)navigationItemDescriptor {
//    PANavigationItemDescriptor *navDescriptior = [super navigationItemDescriptor];
//    
//    [navDescriptior setLeftButton:[self getGoMenuButton:@selector(showLateralMenu)]];
//    [navDescriptior setRightButton:[self getCalendarButton:@selector(showCalendar)]];
//    [navDescriptior setThirdPartyOption:PANavigationThirdItemOption_Calendar];
//    
//    return navDescriptior;
//}

#pragma mark - NavigationDescriptor Subclass responsibility.

//- (void)showLateralMenu {
//    NSLog(@"Show Lateral Menu");
//}

@end
