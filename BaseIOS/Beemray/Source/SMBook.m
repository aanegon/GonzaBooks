//
//  SMBook.m
//  GonzaBOOKS
//
//  Created by Simed on 19/4/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import "SMBook.h"

@interface SMBook ()

@property (nonatomic, readwrite) NSString *title;
@property (nonatomic, readwrite) NSString *bookDescription;
@property (nonatomic, readwrite) NSArray *authors;

@property (nonatomic, assign, getter=isDigitalBook) BOOL digitalBook;

@end

@implementation SMBook

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self != nil) {
        _title = [NSString string];
        _bookDescription = [NSString string];
        _authors = [NSArray arrayWithObjects:@"1",@"2", nil];
    }
    
    return self;
}

- (void)setTitle:(NSString *)title {
    if ([title hasPrefix:@"Libro"]) {
        _digitalBook = YES;
    }
    
}

@end
