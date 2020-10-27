//
//  JSONAPIResponse.m
//  NetworkPlatform
//
//  Created by KarimEbrahem on 10/27/20.
//

#import <Foundation/Foundation.h>
#import "APIResponse.h"
#import "JSONAPIResponse.h"

@implementation JSONAPIResponse

- (id)processResponseObject:(NSError *__autoreleasing *)error
{
    if ([self.responseObject isKindOfClass:[NSData class]]) {
        NSError *serializationError;
        id processedResponseObject = [NSJSONSerialization JSONObjectWithData:self.responseObject options:0 error:&serializationError];
        if (error) *error = serializationError;
        return processedResponseObject;
    }
    else {
        return nil;
    }
}

@end
