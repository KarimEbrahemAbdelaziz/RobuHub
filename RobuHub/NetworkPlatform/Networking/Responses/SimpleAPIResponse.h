//
//  SimpleAPIResponse.h
//  NetworkPlatform
//
//  Created by KarimEbrahem on 10/27/20.
//

#import <Foundation/Foundation.h>
#import "APIResponse.h"

@interface SimpleAPIResponse: NSObject <APIResponse> {
    NSURLSessionDataTask *_task;
    NSURLResponse *_response;
    NSError *_error;
    id _responseObject;
    id _processedResponseObject;
}

@end
