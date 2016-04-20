//
//  SMAuthor.m
//  GonzaBOOKS
//
//  Created by Simed on 20/4/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import "SMAuthor.h"

static NSString * const kAuthorSeparatorName = @" ";

/**
 *  Struct to know the position of the name, lastname, surname, etc.
 */
typedef NS_ENUM(NSUInteger, SMFullNamePosition) {
    /**
     *  Name
     */
    SMFullNamePosition_Name = 0,
    /**
     *  Last name
     */
    SMFullNamePosition_LastName = 1,
    /**
     *  Surname
     */
    SMFullNamePosition_SurName = 2
};

@interface SMAuthor ()

@property (nonatomic, readwrite) NSString *name;
@property (nonatomic, readwrite) NSString *lastName;
@property (nonatomic, readwrite) NSString *surname;

@end

@implementation SMAuthor

#pragma mark - Initializers

- (instancetype)init {
    return [self initWithFullName:[NSString string]];
}

- (instancetype)initWithFullName:(NSString *)fullName {
    self = [super init];
    
    if (self != nil) {
        NSArray *substring = [fullName componentsSeparatedByString:kAuthorSeparatorName];
        
        _name = substring[SMFullNamePosition_Name];
        _lastName = substring[SMFullNamePosition_LastName];
        _surname = substring[SMFullNamePosition_SurName];
    }
    
    return self;
}

#pragma mark - Public methods

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ %@", _name, _lastName];
}

@end
