//
//  PAMenuController.m
//  PassApp
//
//  Created by Alex Anegon on 23/02/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import "PAMenuController.h"
#import "PAMenuCell.h"

NSUInteger const kNumberOfMenuItems = 5;

@interface PAMenuController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UIView *userHeader;

@end

@implementation PAMenuController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"%@", NSStringFromCGRect(self.tableview.frame));
}

#pragma mark - TableView data source methods.

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // try to deque a cell
    PAMenuCell *cell = nil;
    NSString *cellName = NSStringFromClass([PAMenuCell class]);
    
    cell = (PAMenuCell *)[tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PAMenuCell class]) bundle:nil]
        forCellReuseIdentifier:NSStringFromClass([PAMenuCell class])];
        cell = (PAMenuCell *)[tableView dequeueReusableCellWithIdentifier:cellName];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 0.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    return _userHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return CGRectGetHeight([_userHeader frame]);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    return nil;
}

@end
