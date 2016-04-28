//
//  SMBookDetailsViewController.m
//  GonzaBOOKS
//
//  Created by ; on 28/4/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import "SMBookDetailsViewController.h"
#import "AppDelegate.h"

@interface SMBookDetailsViewController ()

@end

@implementation SMBookDetailsViewController

#pragma mark - Public methods

- (IBAction)changeSegmentValue:(id)sender {
    UISegmentedControl *segment = sender;
    NSLog(@"%li", (long)[segment selectedSegmentIndex]);
}

- (IBAction)changeSwitchValue:(id)sender {
    UISwitch *mySwitch = sender;
    NSLog(@"%@", [mySwitch isOn]?@"YES":@"NO");
}

- (IBAction)reloadBookDescription:(id)sender {
    
}

#pragma mark - View life cycle methods

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Paquito" object:nil];
    
    
}

@end
