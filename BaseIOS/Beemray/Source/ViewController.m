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
#import "SMBookDetailsViewController.h"

#import "PABaseViewController+Protected.h"
#import "UIViewController+PABarButtons.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UILabel *noResultsLbl;
@property (nonatomic, weak) IBOutlet UITextField *searchText;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightSearchTextConstraint;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;
@property (nonatomic, strong) UIButton *dismissBt;

@property (nonatomic, strong) NSArray *books;
@property (nonatomic, assign, getter=isLoading) BOOL loading;
@property (nonatomic, strong) UIView *busyView;

@end

@implementation ViewController

#pragma mark - Private methods

- (void)setLoading:(BOOL)loading {
    if (loading != _loading) {
        NSLog(@"CHange all");
        if (loading) {
            if (_busyView == nil) {
                _busyView = [self retrieveBusyView];
            }
            [_busyView setFrame:[self.view frame]];
            [self.view addSubview:_busyView];
        } else {
            //hacemos lo contrario
            [_busyView removeFromSuperview];
            _busyView = nil;
        }
        _loading = loading;
    }
    
    [_tableView setAlpha:!loading];
}

- (void)reloadBooksWithSearch:(NSString *)search {
    
    self.loading = YES;
    
    __weak typeof(self) weakself = self;
    [[SMGoogleWSManager sharedInstance] getItemsWithSearch:search successBlock:^(NSArray *items) {
        __strong typeof(weakself) strongSelf = weakself;
        [strongSelf.noResultsLbl setAlpha:0.0];
        strongSelf.books = items;

        [strongSelf.tableView reloadData];
        strongSelf.loading = NO;
    } errorBlock:^(NSError *error) {
        __strong typeof(weakself) strongSelf = weakself;
        [strongSelf.noResultsLbl setAlpha:1.0];
        [strongSelf.noResultsLbl setText:[error localizedDescription]];
        strongSelf.loading = NO;
    }];
    
}

- (void)hacerCualquierCosa {
    NSLog(@"PAquito ha nacido");
    [_searchText resignFirstResponder];
    
}

- (void)dismissKeyboardButton:(id)sender {
    [_searchText resignFirstResponder];
    [_dismissBt removeFromSuperview];
}

- (void)keyboardWIllShow:(NSNotification *)notif {
    
}

#pragma mark - View life cycle methods

- (void)viewDidLoad {
    [super viewDidLoad];


    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hacerCualquierCosa) name:@"Paquito" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWIllShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hacerCualquierCosa) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardWIllShow:)];
    [_tapGesture setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:_tapGesture];
    
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

    [self removeObserver:self forKeyPath:@"Paquito"];
    [self removeObserver:self forKeyPath:UIKeyboardWillShowNotification];
    [self removeObserver:self forKeyPath:UIApplicationDidEnterBackgroundNotification];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowBookDetail"]) {
        SMBook *book = sender;
        SMBookDetailsViewController *booksVC = [segue destinationViewController];
    }
}

#pragma mark - UItableViewdelegate methods

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"ShowBookDetail" sender:nil];

    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"");
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

#pragma mark - UItextfieldDelegate Methods

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if ([textField isEqual:_searchText]) {
//        _heightSearchTextConstraint.constant += 20.0;
//        [UIView animateWithDuration:0.5 animations:^{
//            [self.view layoutIfNeeded];
//        } completion:^(BOOL finished) {
//        }];
    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
//    _dismissBt = [UIButton buttonWithType:UIButtonTypeCustom];
//    [_dismissBt setBackgroundColor:[UIColor clearColor]];
//    [_dismissBt setFrame:[[self view] frame]];
//    [_dismissBt addTarget:self action:@selector(dismissKeyboardButton:) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:_dismissBt];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self reloadBooksWithSearch:[textField text]];
    [self dismissKeyboardButton:nil];

    return YES;
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
