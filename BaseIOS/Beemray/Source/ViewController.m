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
#import "SMBook.h"

#import "PABaseViewController+Protected.h"
#import "UIViewController+PABarButtons.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UILabel *noResultsLbl;
@property (nonatomic, weak) IBOutlet UITextField *searchText;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) NSArray *books;

@end

@implementation ViewController

#pragma mark - View life cycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    __weak typeof(self) weakself = self;
    [[SMGoogleWSManager sharedInstance] getItemsWithSearch:@"rings" successBlock:^(NSArray *items) {
        __strong typeof(weakself) strongSelf = weakself;
        [strongSelf.noResultsLbl setAlpha:0.0];
        strongSelf.books = items;
        
        [strongSelf.tableView reloadData];
    } errorBlock:^(NSError *error) {
        __strong typeof(weakself) strongSelf = weakself;
        [strongSelf.noResultsLbl setAlpha:1.0];
        [strongSelf.noResultsLbl setText:[error localizedDescription]];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowBookDetail"]) {
        
    }
}

#pragma mark - UItableViewdelegate methods

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"ShowBookDetail" sender:nil];
    
    return nil;
}

#pragma mark - UITableViewDatasource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_books count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"newFriendCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    SMBook *book = _books[[indexPath row]];
    NSString *sectionAndrow = [NSString stringWithFormat:@"Title: %@", [book title]];
    [cell.textLabel setText:sectionAndrow];
    
    //etc.
    return cell;
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
