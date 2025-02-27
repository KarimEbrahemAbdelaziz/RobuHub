//
//  APIRequest.m
//  NetworkPlatform
//
//  Created by KarimEbrahem on 10/27/20.
//

#import <Foundation/Foundation.h>
#import "APIRequest.h"
#import "APIResponse.h"
#import "SimpleAPIResponse.h"
#import "JSONAPIResponse.h"

@interface SimpleAPIRequest()

@property (nonatomic) HTTPMethod method;
@property (nonatomic, copy) NSURL *baseURL;
@property (nonatomic, copy) NSString *path;
@property (nonatomic, copy) NSDictionary *parameters;
@property (nonatomic, copy) NSDictionary *headers;
@property (nonatomic) Class<APIResponse> responseClass;

@end

@implementation SimpleAPIRequest

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.responseClass = [SimpleAPIResponse class];
    }
    return self;
}

@end

@implementation JSONAPIRequest

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.responseClass = [JSONAPIResponse class];
        self.headers = @{@"Accept": @"application/json", @"Content-type": @"application/json"};
    }
    return self;
}

@end

