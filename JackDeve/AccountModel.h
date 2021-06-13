//
//  AccountModel.h
//  JackDeve
//
//  Created by apple on 17/5/10.
//  Copyright © 2017年 wkq. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^callBackBlock)(NSDictionary * dic);
@interface AccountModel : NSObject
//单例
+(instancetype)showData;
-(void)getDataAndBlock:(callBackBlock)block;
@end
