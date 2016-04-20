//
//  SMImage.m
//  GonzaBOOKS
//
//  Created by Simed on 20/4/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import "SMImage.h"

static NSString * const kImageSmall = @"smallThumbnail";
static NSString * const kImageNormal = @"thumbnail";

@interface SMImage ()

@property (nonatomic, readwrite) NSString *small;
@property (nonatomic, readwrite) NSString *normal;

@end

@implementation SMImage

- (instancetype)init {
    return [self initWithDictionary:nil];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self != nil) {
        _small = dictionary[kImageSmall];
        _normal = dictionary[kImageNormal];
    }
    
    return self;
}

@end
