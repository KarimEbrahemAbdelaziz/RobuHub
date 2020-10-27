//
//  GithubClient.h
//  NetworkPlatform
//
//  Created by KarimEbrahem on 10/27/20.
//

#import <Domain/User.h>
#import <Domain/Repository.h>
#import "RepositoriesResponse.h"

typedef void(^RepositoriesResponseBlock)(RepositoriesResponse *response);

@protocol GithubClient

- (NSURLSessionDataTask *)fetchRepositories:(NSString *)name page:(int)pageNumber countPerPage:(int)countPerPage completion:(RepositoriesResponseBlock)completion;

@end

@interface NSURLSession (GithubClient) <GithubClient>

@end
