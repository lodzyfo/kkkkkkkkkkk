//
//  HomeUserDefault.h
//  JackDeve
//
//  Created by apple on 17/5/9.
//  Copyright © 2017年 wkq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginModel.h"
@interface HomeUserDefault : NSObject
/** 存储*/
+ (void)userDefaultWithModel:(LoginModel *)model;
/** 取值*/
+ (LoginModel *)getUserDefault;
/** 删值*/
+ (void)deleteAllData;

@end
