//
//  LoginModel.h
//  Sunexpress
//
//  Created by 田涛 on 2017/4/17.
//  Copyright © 2017年 张迎港. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginModel : NSObject 

/** 登录认证token*/
@property (nonatomic, copy) NSString *token;
/** 用户手机*/
@property (nonatomic, copy) NSString *mobile;
/** 用户名*/
@property (nonatomic, copy) NSString *user_name;
/** 头像网址*/
@property (nonatomic, copy) NSString *avatar;
/** 0正常登录，1账户锁定禁止登录*/
@property (nonatomic, copy) NSString *is_locked;

@end
