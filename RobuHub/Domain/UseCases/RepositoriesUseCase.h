//
//  RepositoriesUseCase.h
//  Domain
//
//  Created by KarimEbrahem on 10/27/20.
//

#import <Foundation/Foundation.h>

typedef void(^RepositoriesBlock)(NSArray *response);

@protocol RepositoriesUseCase

- (void) fetchRepositories:(NSString *)name page:(int)pageNumber countPerPage:(int)countPerPage completion:(RepositoriesBlock)completion;

@end
