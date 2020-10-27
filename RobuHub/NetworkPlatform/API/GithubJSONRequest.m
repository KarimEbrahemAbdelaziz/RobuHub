//
//  GithubJSONRequest.m
//  NetworkPlatform
//
//  Created by KarimEbrahem on 10/27/20.
//

#import <Foundation/Foundation.h>
#import "GithubJSONRequest.h"

@implementation GithubJSONRequest

- (NSURL *)baseURL
{
    return [NSURL URLWithString:@"https://api.github.com"];
}

@end
