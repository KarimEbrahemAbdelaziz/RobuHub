//
//  HTTPMethod.m
//  NetworkPlatform
//
//  Created by KarimEbrahem on 10/27/20.
//

#import <Foundation/Foundation.h>
#import "HTTPMethod.h"

NSString *HTTPMethodString(HTTPMethod method) {
    switch (method) {
        case GET:       return @"GET";
        case POST:      return @"POST";
        case PUT:       return @"PUT";
        case DELETE:    return @"DELETE";
        case HEAD:      return @"HEAD";
        default:        return nil;
    }
}
