//
//  UIView+Position.h
//  PassApp
//
//  Created by Alex Anegon on 23/02/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Position)

@property (nonatomic) CGPoint frameOrigin;
@property (nonatomic) CGSize frameSize;

@property (nonatomic) CGFloat frameX;
@property (nonatomic) CGFloat frameY;

// Setting these modifies the origin but not the size.
@property (nonatomic) CGFloat frameRight;
@property (nonatomic) CGFloat frameBottom;

@property (nonatomic) CGFloat frameWidth;
@property (nonatomic) CGFloat frameHeight;

// Methods for centering.
- (void)addCenteredSubview:(UIView *)subview;
- (void)moveToCenterOfSuperview;
- (void)centerVerticallyInSuperview;
- (void)centerHorizontallyInSuperview;

@end
