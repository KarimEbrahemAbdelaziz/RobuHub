//
//  GithubClient.m
//  NetworkPlatform
//
//  Created by KarimEbrahem on 10/27/20.
//

#import <Foundation/Foundation.h>
#import "GithubClient.h"
#import "APIClient.h"
#import "RepositoriesRequest.h"

@implementation NSURLSession (GithubClient)

- (NSURLSessionDataTask *)fetchRepositories:(NSString *)name page:(int)pageNumber countPerPage:(int)countPerPage completion:(RepositoriesResponseBlock)completion;
{
    RepositoriesRequest *request = [[RepositoriesRequest alloc] init];
    NSDictionary *dict = @{@"q": name, @"page": [NSString stringWithFormat:@"%i", pageNumber], @"per_page": [NSString stringWithFormat:@"%i", countPerPage]};
    [request setValue:dict forKey:@"parameters"];
    NSURLSessionDataTask *task = [self dataTaskWithAPIRequest:request completion:completion];
    [task resume];
    return task;
}

@end
