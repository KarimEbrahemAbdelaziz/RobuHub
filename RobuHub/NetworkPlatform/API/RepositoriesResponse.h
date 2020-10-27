//
//  RepositoriesResponse.h
//  NetworkPlatform
//
//  Created by KarimEbrahem on 10/27/20.
//

#import "JSONAPIResponse.h"
#import <Domain/Repository.h>

@interface RepositoriesResponse: JSONAPIResponse

- (NSArray *)repositories;

@end

