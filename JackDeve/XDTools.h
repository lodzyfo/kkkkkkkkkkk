//
//  XDTools.h
//  ZhouHanOnline
//
//  Created by iCode on 2016/10/24.
//  Copyright © 2016年 iCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XDTools : NSObject

//获取字符串(或汉字)首字母
+ (NSString *)firstCharacterWithString:(NSString *)string;

//判断手机号码格式是否正确
+ (BOOL)isMobileNumber:(NSString *)mobileNumber;

//判断注册邮箱是否正确
+ (BOOL)isAvailableEmail:(NSString *)email;

//判断字符串中是否含有空格
+ (BOOL)isHaveSpaceInString:(NSString *)string;

//判断字符串中是否含有某个字符串
+ (BOOL)isHaveString:(NSString *)string1 InString:(NSString *)string2;

//判断字符串中是否含有中文
+ (BOOL)isHaveChineseInString:(NSString *)string;

//判断字符串是否全部为数字
+ (BOOL)isAllNum:(NSString *)string;

//校验身份证号码(老的15位,新的18位)
+ (BOOL)isAllIDcard:(NSString *)card;

//检查数组,字典,字符串是否为空.
+(BOOL)isNilOfSender:(NSObject *)sender;

@end
