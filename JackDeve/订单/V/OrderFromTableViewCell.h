//
//  OrderFromTableViewCell.h
//  JackDeve
//
//  Created by 王奎卿 on 2017/5/9.
//  Copyright © 2017年 wkq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderFromTableViewCell : UITableViewCell

/**
 *  用户头像
 */
@property (nonatomic,strong) UIImageView *userImg;

/**
 *  商家名
 */
@property (nonatomic,strong) UILabel *diner_name;

/**
 *  订单状态
 */
@property (nonatomic,strong) UILabel *order_status;

/**
 *  商品
 */
@property (nonatomic,strong) UILabel *goods_one, *goods_two, *goods_three;

/**
 *  商品数量
 */
@property (nonatomic,strong) UILabel *count_one, *count_two, *count_three;

/**
 *  多出商品省略号
 */
@property (nonatomic,strong) UILabel *ellipsis;

/**
 *  商品共计
 */
@property (nonatomic,strong) UILabel *total;

/**
 *  商品总价
 */
@property (nonatomic,strong) UILabel *total_price;

/**
 *  上分割线
 */
@property (nonatomic,strong) UILabel *divider_top;

/**
 *  下分割线
 */
@property (nonatomic,strong) UILabel *divider_down;

/**
 *  取消按钮
 */
@property (nonatomic,strong) UIButton *cancelBtn;

/**
 *  再来一单按钮
 */
@property (nonatomic,strong) UIButton *againBtn;

@end
