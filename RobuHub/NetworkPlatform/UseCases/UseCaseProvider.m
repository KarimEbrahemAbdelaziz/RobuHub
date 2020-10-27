//
//  UseCaseProvider.m
//  NetworkPlatform
//
//  Created by KarimEbrahem on 10/27/20.
//

#import <Foundation/Foundation.h>
#import "UseCaseProvider.h"
#import "RepositoriesUseCase.h"

@implementation UseCaseProvider

- (id<RepositoriesUseCase>)makeRepositoriesUseCase {
    return [[RepositoriesUseCase alloc] init];
}

@end
