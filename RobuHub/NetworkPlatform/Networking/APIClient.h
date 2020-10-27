//
//  APIClient.h
//  NetworkPlatform
//
//  Created by KarimEbrahem on 10/27/20.
//

#import <Foundation/Foundation.h>
#import "APIRequest.h"
#import "APIResponse.h"

typedef void(^APIClientCompletionBlock)(id<APIResponse> response);

@protocol APIClient <NSObject>

- (NSURLSessionDataTask *)dataTaskWithAPIRequest:(id<APIRequest>)request
                                      completion:(APIClientCompletionBlock)completion;

@end

@interface NSURLSession(APIClient) <APIClient>

@end
