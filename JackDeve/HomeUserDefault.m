//
//  HomeUserDefault.m
//  JackDeve
//
//  Created by apple on 17/5/9.
//  Copyright © 2017年 wkq. All rights reserved.
//

#import "HomeUserDefault.h"
#define TOKEN_KEY @"token"
#define MOBILE_KEY @"mobile"
#define USERNAME_KEY @"user_name"
#define AVATAR_KEY @"avatar"
#define IS_LOCKED_KEY @"is_locked"
@implementation HomeUserDefault
+ (void)userDefaultWithModel:(Data *)model {
    //创建
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    // 存储头像
    [userDefaults setObject:model.avatar forKey:AVATAR_KEY];
    // 存储用户手机
    [userDefaults setObject:model.mobile forKey:MOBILE_KEY];
    // 存储用户名
    [userDefaults setObject:model.user_name forKey:USERNAME_KEY];
    // 存储token
    [userDefaults setObject:model.token forKey:TOKEN_KEY];
    // 存储 is_locked ( 0正常登录，1账户锁定禁止登录)
    [userDefaults setObject:model.is_locked forKey:IS_LOCKED_KEY];
    //必须
    [[NSUserDefaults standardUserDefaults]synchronize];
}

+ (Data *)getUserDefault {
    // 初始化Model
    Data *model = [[Data alloc] init];
    //创建
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    // 头像
    model.avatar    = [userDefaults objectForKey:AVATAR_KEY];
    // 用户手机
    model.mobile    = [userDefaults objectForKey:MOBILE_KEY];
    // 用户名
    model.user_name = [userDefaults objectForKey:USERNAME_KEY];
    // token
    model.token     = [userDefaults objectForKey:TOKEN_KEY];
    // is_locked
    model.is_locked = [userDefaults objectForKey:IS_LOCKED_KEY];
    
    return model;
}

+ (void)deleteAllData {
    //创建
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:AVATAR_KEY];
    [userDefaults removeObjectForKey:MOBILE_KEY];
    [userDefaults removeObjectForKey:USERNAME_KEY];
    [userDefaults removeObjectForKey:TOKEN_KEY];
    [userDefaults removeObjectForKey:IS_LOCKED_KEY];
}
@end
