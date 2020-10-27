//
//  RepositoriesUseCase.m
//  NetworkPlatform
//
//  Created by KarimEbrahem on 10/27/20.
//

#import <Foundation/Foundation.h>
#import "RepositoriesUseCase.h"

@implementation RepositoriesUseCase

- (id)init
{
    self.github = [NSURLSession sharedSession];
    return self;
}

- (void)fetchRepositories:(NSString *)name page:(int)pageNumber countPerPage:(int)countPerPage completion:(RepositoriesBlock)completion {
    [self.github fetchRepositories:name page:pageNumber countPerPage:countPerPage completion:^(RepositoriesResponse *response) {
    completion(response.repositories);
    }];
}

@end
