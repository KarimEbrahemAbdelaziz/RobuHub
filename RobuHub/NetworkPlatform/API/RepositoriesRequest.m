//
//  RepositoriesRequest.m
//  NetworkPlatform
//
//  Created by KarimEbrahem on 10/27/20.
//

#import "HTTPMethod.h"
#import "RepositoriesRequest.h"
#import "RepositoriesResponse.h"

@implementation RepositoriesRequest

- (HTTPMethod)method
{
    return GET;
}

- (NSString *)path
{
    return @"search/repositories";
}

- (Class)responseClass
{
    return [RepositoriesResponse class];
}

@end
