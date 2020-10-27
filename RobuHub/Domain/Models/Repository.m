//
//  Repository.m
//  Domain
//
//  Created by KarimEbrahem on 10/27/20.
//

#import <Foundation/Foundation.h>
#import "Repository.h"
#import "User.h"

@implementation Repository

+ (Repository *)initWithDict:(NSDictionary *)dict
{
    if (!dict) { return Nil; }
    
    Repository *model = [[Repository alloc]init];
    
    model.userId = [[dict objectForKey: @"id"] intValue];
    model.name = [dict objectForKey: @"name"];
    model.full_name = [dict objectForKey: @"full_name"];
    model.repositoryDescription = [[dict objectForKey: @"description"] isEqual:(id) NULL] ? @"" : [dict objectForKey: @"description"];
    model.created_at = [dict objectForKey: @"created_at"];
    model.homepage =[[dict objectForKey: @"homepage"] isEqual:(id) NULL] ? @"" : [dict objectForKey: @"homepage"];
    model.stargazers_count = [[dict objectForKey: @"stargazers_count"] intValue];
     model.language =[[dict objectForKey: @"language"] isEqual:(id) NULL] ? @"" : [dict objectForKey: @"language"];
    model.forks_count = [[dict objectForKey: @"forks_count"] intValue];
    NSDictionary *owner = [dict objectForKey: @"owner"];
    model.owner = [User initWithDict: owner];
    
    NSDictionary *parent = [dict objectForKey: @"parent"];
    NSDictionary *parentOwner = [parent objectForKey: @"owner"];
    model.parentOwnerName = [parentOwner objectForKey: @"login"];
    model.mirror_url = [[dict objectForKey: @"mirror_url"] isEqual:(id) NULL] ? @"" : [dict objectForKey: @"mirror_url"];

    return model;
}

@end
