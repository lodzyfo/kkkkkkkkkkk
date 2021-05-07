//
//  PreferentialModel.h
//  JackDeve
//
//  Created by 王奎卿 on 2017/5/9.
//  Copyright © 2017年 wkq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PreferentialModel : NSObject

/**
 *  商品ID
 */
@property (nonatomic,strong) NSString *goods_id;

/**
 *  商铺ID
 */
@property (nonatomic,strong) NSString *diner_id;

/**
 *  商品名
 */
@property (nonatomic,strong) NSString *goods_name;

/**
 *  商铺名
 */
@property (nonatomic,strong) NSString *diner_name;

/**
 *  商品图片
 */
@property (nonatomic,strong) NSString *goods_pic;

/**
 *  商品价格
 */
@property (nonatomic,strong) NSString *goods_price;

@end
