//
//  NSObject+JSONSerialization.h
//  Domain
//
//  Created by KarimEbrahem on 10/27/20.
//

#import <Foundation/Foundation.h>

@interface NSObject (JSONSerialization)

+ (NSArray *)withArray:(NSArray *)array;
+ (instancetype)initWithDict:(NSDictionary *)dict;

@end
