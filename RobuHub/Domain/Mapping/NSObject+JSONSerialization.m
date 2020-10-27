//
//  NSObject+JSONSerialization.m
//  Domain
//
//  Created by KarimEbrahem on 10/27/20.
//

#import <Foundation/Foundation.h>
#import "NSObject+JSONSerialization.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation NSObject (JSONSerialization)

+ (instancetype)initWithDict:(NSDictionary *)dict
{
    return nil;
}

+ (NSArray *)withArray:(NSArray *)array
{
    NSMutableArray *result = [@[] mutableCopy];
    for (NSDictionary *dict in array) {
        id item = [self initWithDict:dict];
        if (item) {
            [result addObject:item];
        }
    }
    return [result copy];
}

@end
