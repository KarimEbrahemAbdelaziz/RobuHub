//
//  APIRequest.h
//  NetworkPlatform
//
//  Created by KarimEbrahem on 10/27/20.
//

#import <Foundation/Foundation.h>
#import "HTTPMethod.h"

@protocol APIResponse;

@protocol APIRequest <NSObject>

- (HTTPMethod)method;
- (NSURL *)baseURL;
- (NSString *)path;
- (NSDictionary *)parameters;
- (NSDictionary *)headers;
- (Class<APIResponse>)responseClass;

@end

@interface SimpleAPIRequest: NSObject <APIRequest>

@end

@interface JSONAPIRequest: SimpleAPIRequest

@end
