//
//  RepositoriesResponse.m
//  NetworkPlatform
//
//  Created by KarimEbrahem on 10/27/20.
//

#import <Foundation/Foundation.h>
#import "RepositoriesResponse.h"
#import "Domain/Repository.h"

@implementation RepositoriesResponse

- (id)processResponseObject:(NSError **)error;
{
    NSError *__error;
    id processedResponseObject = [super processResponseObject:&__error];
    id<NSObject> value = processedResponseObject[@"items"];
    if (__error || ![value isKindOfClass:[NSArray class]]) {
        if (error) *error = __error;
        return nil;
    }
    else {
        return [Repository withArray:value];
    }
}

- (NSArray *)repositories
{
    return self.processedResponseObject;
}

@end

