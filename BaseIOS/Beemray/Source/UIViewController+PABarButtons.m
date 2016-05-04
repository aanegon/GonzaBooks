//
//  UIViewController+PABarButtons.m
//  PassApp
//
//  Created by Alex Anegon on 23/02/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import "UIViewController+PABarButtons.h"

static NSString * const kMenuButtonImage = @"";
static NSString * const kGoBackButtonImage = @"";
static NSString * const kCalendarButtonImage = @"";
static NSString * const kSearchButtonImage = @"";
static double const kMinButtonSize = 40.0;

@implementation UIViewController (PABarButtons)

- (UIBarButtonItem *)getGoMenuButton:(SEL)action {
    UIImage *menuButtonImage = [UIImage imageNamed:kMenuButtonImage];
    UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [menuButton setImage:menuButtonImage
                  forState:UIControlStateNormal];
    
//    [menuButton setFrameSize:menuButtonImage.size];
    CGSize newSize = CGSizeMake(40.0, 40.0);
    [menuButton setFrame:CGRectMake(menuButton.frame.origin.x,
                                    menuButton.frame.origin.y,
                                    newSize.width,
                                    newSize.height)];
    
    [menuButton setBackgroundColor:[UIColor yellowColor]];
    
    [menuButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];

    return [[UIBarButtonItem alloc] initWithCustomView:menuButton];
}

- (UIBarButtonItem *)getGoBackButton:(SEL)action {
    UIImage *goBackButtonImage = [UIImage imageNamed:kGoBackButtonImage];
    UIButton *goBackButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [goBackButton setImage:goBackButtonImage forState:UIControlStateNormal];

    //    [menuButton setFrameSize:menuButtonImage.size];
    CGSize newSize = CGSizeMake(40.0, 40.0);
    [goBackButton setFrame:CGRectMake(goBackButton.frame.origin.x,
                                      goBackButton.frame.origin.y,
                                      newSize.width,
                                      newSize.height)];
    [goBackButton setBackgroundColor:[UIColor purpleColor]];

    [goBackButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];

    return [[UIBarButtonItem alloc] initWithCustomView:goBackButton];
}

- (UIBarButtonItem *)getCalendarButton:(SEL)action {
    UIImage *calendarButtonImage = [UIImage imageNamed:kCalendarButtonImage];
    UIButton *calendarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [calendarButton setImage:calendarButtonImage forState:UIControlStateNormal];
    
    //    [menuButton setFrameSize:menuButtonImage.size];
    CGSize newSize = CGSizeMake(40.0, 40.0);
    [calendarButton setFrame:CGRectMake(calendarButton.frame.origin.x,
                                        calendarButton.frame.origin.y,
                                        newSize.width,
                                        newSize.height)];
    [calendarButton setBackgroundColor:[UIColor greenColor]];
    
    [calendarButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:calendarButton];
}

- (UIBarButtonItem *)getSearchButton:(SEL)action {
    UIImage *searchButtonImage = [UIImage imageNamed:kSearchButtonImage];
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [searchButton setImage:searchButtonImage forState:UIControlStateNormal];

    //    [menuButton setFrameSize:menuButtonImage.size];
    CGSize newSize = CGSizeMake(40.0, 40.0);
    [searchButton setFrame:CGRectMake(searchButton.frame.origin.x,
                                      searchButton.frame.origin.y,
                                      newSize.width,
                                      newSize.height)];
    [searchButton setBackgroundColor:[UIColor redColor]];

    [searchButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];

    return [[UIBarButtonItem alloc] initWithCustomView:searchButton];
}

- (UIBarButtonItem *)getButtonWithText:(NSString *)text action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:text forState:UIControlStateNormal];
    UIFont *fontButton = [UIFont systemFontOfSize:10.0];
    [[button titleLabel] setFont:fontButton];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor greenColor]];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName : fontButton,
                                 NSForegroundColorAttributeName : [UIColor blackColor]
                                 };
    
    CGSize size = [text sizeWithAttributes:attributes];
    
    //seguro estoy de que tu así no lo harías.... pero funca jajaj
    if (size.width < kMinButtonSize) {
        size.width = kMinButtonSize;
    }
    if (size.height < kMinButtonSize) {
        size.height = kMinButtonSize;
    }
    
    CGRect rect = CGRectMake([button frame].origin.x, [button frame].origin.y, size.width, size.height);
    
    [button setFrame:rect];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
