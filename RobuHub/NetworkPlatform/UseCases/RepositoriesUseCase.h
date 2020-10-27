//
//  RepositoriesUseCase.h
//  NetworkPlatform
//
//  Created by KarimEbrahem on 10/27/20.
//

#import "Domain/RepositoriesUseCase.h"
#import "APIClient.h"
#import "GithubClient.h"

@interface RepositoriesUseCase: NSObject <RepositoriesUseCase>

@property (nonatomic) id<APIClient, GithubClient> github;

@end
