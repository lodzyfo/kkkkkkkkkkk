//
//  PreferentialCell.h
//  JackDeve
//
//  Created by 王奎卿 on 2017/5/9.
//  Copyright © 2017年 wkq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PreferentialCell : UITableViewCell

/**
 *  商品图片
 */
@property (nonatomic,strong) UIImageView *goodsView;

/**
 *  商品名字
 */
@property (nonatomic,strong) UILabel *goodsName;

/**
 *  商铺名字
 */
@property (nonatomic,strong) UILabel *dinnerName;

/**
 *  优惠价
 */
@property (nonatomic,strong) UILabel *prefer;

/**
 *  商品价格
 */
@property (nonatomic,strong) UILabel *goodsPrice;

/**
 *  抢购按钮
 */
@property (nonatomic,strong) UIButton *snapBtn;

@end
