//
//  User.h
//  Domain
//
//  Created by KarimEbrahem on 10/27/20.
//

#import <Foundation/Foundation.h>
#import "NSObject+JSONSerialization.h"

@interface User: NSObject

@property(nonatomic, assign) double myID;
@property(nonatomic, assign) int rank;
@property(nonatomic, copy) NSString *categoryLocation;
@property(nonatomic, copy) NSString *categoryLanguage;
@property(nonatomic, copy) NSString *login;
@property(nonatomic, assign) int userId;
@property(nonatomic, copy) NSString *avatar_url;
@property(nonatomic, copy) NSString *gravatar_id;
@property(nonatomic, copy) NSString *url;
@property(nonatomic, copy) NSString *html_url;
@property(nonatomic, copy) NSString *followers_url;
@property(nonatomic, copy) NSString *following_url;
@property(nonatomic, copy) NSString *gists_url;
@property(nonatomic, copy) NSString *starred_url;
@property(nonatomic, copy) NSString *subscriptions_url;
@property(nonatomic, copy) NSString *organizations_url;
@property(nonatomic, copy) NSString *repos_url;
@property(nonatomic, copy) NSString *events_url;
@property(nonatomic, copy) NSString *received_events_url;
@property(nonatomic, copy) NSString *type;
@property(nonatomic, assign) BOOL site_admin;
@property(nonatomic, copy) NSString *score;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *company;
@property(nonatomic, copy) NSString *blog;
@property(nonatomic,copy) NSString *location;
@property(nonatomic,copy) NSString *email;
@property(nonatomic,assign) int public_repos;
@property(nonatomic,assign) int followers;
@property(nonatomic,assign) int following;
@property(nonatomic,copy) NSString *created_at;

@end

