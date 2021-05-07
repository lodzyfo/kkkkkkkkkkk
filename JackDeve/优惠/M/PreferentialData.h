//
//  PreferentialData.h
//  JackDeve
//
//  Created by 王奎卿 on 2017/5/9.
//  Copyright © 2017年 wkq. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PreferentialDataDelegate <NSObject>

- (void)jsonData:(NSMutableArray *)array;

@end

@interface PreferentialData : NSObject

/**
 * 单例
 */
+ (instancetype)shareData;

/**
 * 解析数据
 */
- (void)getPreferentialData:(NSString *)url;

/**
 *  代理
 */
@property (nonatomic,strong) id <PreferentialDataDelegate> delegate;

PreferentialData *preferentialData(id name);

@end
