//
//  Repository.h
//  Domain
//
//  Created by KarimEbrahem on 10/27/20.
//

#import <Foundation/Foundation.h>
#import "NSObject+JSONSerialization.h"
#import "User.h"

@interface Repository: NSObject

@property(nonatomic,assign) int userId;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *full_name;
@property(nonatomic,copy) NSString *repositoryDescription;
@property(nonatomic,copy) NSString *created_at;
@property(nonatomic,copy) NSString *homepage;
@property(nonatomic,assign) int stargazers_count;
@property(nonatomic,copy) NSString *language;
@property(nonatomic,assign) int forks_count;
@property(nonatomic,strong) User *owner;
@property(nonatomic,copy) NSString *mirror_url;

@property(nonatomic,copy) NSString *parentOwnerName;

@end

