//
//  SMBookDetailsViewController.m
//  GonzaBOOKS
//
//  Created by ; on 28/4/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import "SMBookDetailsViewController.h"
#import "PANavigationItemDescriptor.h"
#import "AppDelegate.h"
#import "SMBook.h"
#import "SMImage.h"
#import "SMGoogleWSManager.h"

#import "PABaseViewController+Protected.h"
#import "UIViewController+PABarButtons.h"

#import <UIKit/UIKit.h>

@interface SMBookDetailsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *imagesSegmentedControl;
@property (weak, nonatomic) IBOutlet UIImageView *bookImageView;
@property (weak, nonatomic) IBOutlet UITextView *bookDescription;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingActivity;
@property (nonatomic, assign, getter=isLoading) BOOL loading;
@property (weak, nonatomic) IBOutlet UITextView *bookAverating;

@end

@implementation SMBookDetailsViewController

#pragma mark - Private method

- (void)setLoading:(BOOL)loading {
    if (_loading != loading) {
        _loading = loading;
        
        (loading) ? [_loadingActivity startAnimating] : [_loadingActivity stopAnimating];
        
        [_loadingActivity setAlpha:loading];
    }
}

/**
 *  To setup all the view with book data.
 */
- (void)setup {
    [self setTitle:[_book title]];
    [_bookDescription setText:[_book bookDescription]];
    [_bookAverating setText:[[_book averageRating] stringValue]];
    [_imagesSegmentedControl setSelectedSegmentIndex:0];
    
    [_bookDescription setContentOffset: CGPointMake(0,-220) animated:NO];
    
    NSURL *bookURL = [NSURL URLWithString:[[_book images] small]];
    
    self.loading = YES;
    __weak typeof(self) weakself = self;
    [[SMGoogleWSManager sharedInstance] getBookImageWithURL:bookURL completionBlock:^(UIImage *image) {
        __strong typeof(weakself) strongself = weakself;
        [strongself.bookImageView setImage:image];
        strongself.loading = NO;
    }];
}

/**
 *  Go to previous view controller.
 */
- (void)goBack {
    [[self navigationController] popViewControllerAnimated:YES];
}

#pragma mark - Public methods

- (IBAction)changeSegmentValue:(id)sender {
    UISegmentedControl *segment = sender;
    NSLog(@"%li", (long)[segment selectedSegmentIndex]);
    NSURL *bookURL;
    
    switch ([segment selectedSegmentIndex]) {
        case 0:
        {
            SMImage *imagenes = [_book images];
            bookURL = [NSURL URLWithString:[imagenes small]];
            break;
        }
        case 1:
        {
            SMImage *imagenes = [_book images];
            bookURL = [NSURL URLWithString:[imagenes normal]];
            break;
        }
        default:
            break;
    }
    
    self.loading = YES;
    __weak typeof(self) weakself = self;
    [[SMGoogleWSManager sharedInstance] getBookImageWithURL:bookURL completionBlock:^(UIImage *image) {
        __strong typeof(weakself) strongself = weakself;
        [strongself.bookImageView setImage:image];
        strongself.loading = NO;
    }];
}

#pragma mark - View life cycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

#pragma mark - NavigationDescriptor methods.

- (PANavigationItemDescriptor *)navigationItemDescriptor {
    PANavigationItemDescriptor *navDescriptior = [super navigationItemDescriptor];

    [navDescriptior setLeftButton:[self getGoBackButton:@selector(goBack)]];

    return navDescriptior;
}

@end
