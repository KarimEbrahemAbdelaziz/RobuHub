//
//  UseCaseProvider.h
//  Domain
//
//  Created by KarimEbrahem on 10/27/20.
//

#import <Foundation/Foundation.h>
#import "RepositoriesUseCase.h"

@protocol UseCaseProvider

- (id<RepositoriesUseCase>) makeRepositoriesUseCase;

@end
