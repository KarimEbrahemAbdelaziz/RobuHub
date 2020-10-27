//
//  APIResponse.h
//  NetworkPlatform
//
//  Created by KarimEbrahem on 10/27/20.
//

#import <Foundation/Foundation.h>

@protocol APIResponse <NSObject>

- (NSURLSessionDataTask *)task;
- (NSURLResponse *)response;
- (NSError *)error;
- (id)responseObject;
- (id)processedResponseObject;

- (instancetype)initWithTask:(NSURLSessionDataTask *)task
                    response:(NSURLResponse *)response
              responseObject:(id)responseObject
                       error:(NSError *)error;

- (id)processResponseObject:(NSError **)error;

@end
