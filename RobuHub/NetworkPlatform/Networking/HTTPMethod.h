//
//  HTTPMethod.h
//  NetworkPlatform
//
//  Created by KarimEbrahem on 10/27/20.
//

#ifndef HTTPMETHOD_H_
#define HTTPMETHOD_H_

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, HTTPMethod){
    GET, POST, PUT, DELETE, HEAD
};

extern NSString *HTTPMethodString(HTTPMethod method);

#endif
