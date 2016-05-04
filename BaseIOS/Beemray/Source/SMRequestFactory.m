//
//  SMRequestFactory.m
//  GonzaBOOKS
//
//  Created by Simed on 20/4/16.
//  Copyright © 2016 i2a. All rights reserved.
//

#import "SMRequestFactory.h"

static NSString * const kGoogleBooksBaseURL = @"https://www.googleapis.com/books/v1/volumes?q=%@";

static NSTimeInterval const kGoogleBooksTimeOut = 30.0;

static NSString * const kGoogleBooksUserAgent = @"Google Books 1.0";

static NSString * const kGoogleJSONDataFormat = @"application/json;charset=utf-8";

@implementation SMRequestFactory

+ (NSURLRequest *)searchItemsWithText:(NSString *)text {
    NSString *urlString = [NSString stringWithFormat:kGoogleBooksBaseURL, text];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]
                                                           cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                       timeoutInterval:kGoogleBooksTimeOut];
    
    [request addValue:kGoogleBooksUserAgent forHTTPHeaderField:@"User-Agent"];
    [request addValue:kGoogleJSONDataFormat forHTTPHeaderField:@"Accept"];
    
    return request;
}

+ (NSURLRequest *)imageWithURL:(NSURL *)imageUrl {
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:imageUrl
                                                           cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                       timeoutInterval:60.0];
    
    [request addValue:kGoogleBooksUserAgent forHTTPHeaderField:@"User-Agent"];
    [request addValue:kGoogleJSONDataFormat forHTTPHeaderField:@"Accept"];
    
    return request;
}

@end
