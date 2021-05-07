//
//  OrderFromTableViewCell.m
//  JackDeve
//
//  Created by 王奎卿 on 2017/5/9.
//  Copyright © 2017年 wkq. All rights reserved.
//

#import "OrderFromTableViewCell.h"
#import <SDAutoLayout.h>

@implementation OrderFromTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addChild];
        [self orderCellShow];
    }
    return self;
}

- (void)addChild
{
    [self.contentView addSubview:self.userImg];
    [self.contentView addSubview:self.diner_name];
    [self.contentView addSubview:self.order_status];
    [self.contentView addSubview:self.goods_one];
    [self.contentView addSubview:self.goods_two];
    [self.contentView addSubview:self.goods_three];
    [self.contentView addSubview:self.count_one];
    [self.contentView addSubview:self.count_two];
    [self.contentView addSubview:self.count_three];
    [self.contentView addSubview:self.ellipsis];
    [self.contentView addSubview:self.total];
    [self.contentView addSubview:self.total_price];
    [self.contentView addSubview:self.divider_top];
    [self.contentView addSubview:self.divider_down];
    [self.contentView addSubview:self.cancelBtn];
    [self.contentView addSubview:self.againBtn];
}

- (void)orderCellShow
{
    // 用户头像
    self.userImg.sd_layout
    .topSpaceToView(self.contentView,6)
    .leftSpaceToView(self.contentView,15)
    .heightIs(39)
    .widthIs(39);
    // 商家名称
    self.diner_name.sd_layout
    .topSpaceToView(self.contentView,14)
    .leftSpaceToView(self.userImg,10)
    .rightSpaceToView(self.contentView,172)
    .heightIs(22);
    // 订单状态
    self.order_status.sd_layout
    .topSpaceToView(self.contentView,16)
    .leftSpaceToView(self.diner_name,91)
    .widthIs(66).heightIs(18);
    // 上分割线
    self.divider_top.sd_layout
    .topSpaceToView(self.userImg,14)
    .leftSpaceToView(self.contentView,62)
    .rightSpaceToView(self.contentView,0)
    .heightIs(0.5);
    // 商品
    self.goods_one.sd_layout
    .topSpaceToView(self.divider_top,12)
    .leftSpaceToView(self.contentView,62)
    .rightSpaceToView(self.contentView,248)
    .heightIs(18);
    
    self.goods_two.sd_layout
    .topSpaceToView(self.goods_one,7.5)
    .leftSpaceToView(self.contentView,62)
    .rightSpaceToView(self.contentView,248)
    .heightIs(18);
    
    self.goods_three.sd_layout
    .topSpaceToView(self.goods_two,7.5)
    .leftSpaceToView(self.contentView,62)
    .rightSpaceToView(self.contentView,248)
    .heightIs(18);
    // 多出商品省略号
    self.ellipsis.sd_layout
    .topSpaceToView(self.goods_three,7.5)
    .leftSpaceToView(self.contentView,62)
    .rightSpaceToView(self.contentView,248)
    .heightIs(18);
    // 商品数量
    self.count_one.sd_layout
    .topSpaceToView(self.divider_top,7.5)
    .leftSpaceToView(self.goods_one,221)
    .widthIs(12).heightIs(18);
    
    self.count_two.sd_layout
    .topSpaceToView(self.count_one,7.5)
    .leftSpaceToView(self.goods_two,221)
    .widthIs(12).heightIs(18);
    
    self.count_three.sd_layout
    .topSpaceToView(self.count_two,7.5)
    .leftSpaceToView(self.goods_three,221)
    .widthIs(12).heightIs(18);
    // 共计
    self.total.sd_layout
    .topSpaceToView(self.count_three,7.5)
    .leftSpaceToView(self.contentView,214)
    .rightSpaceToView(self.contentView,56)
    .heightIs(18);
    // 商品总价
    self.total_price.sd_layout
    .topSpaceToView(self.count_three,7.5)
    .leftSpaceToView(self.total,3)
    .rightSpaceToView(self.contentView,15)
    .heightIs(18);
    // 下分割线
    self.divider_down.sd_layout
    .topSpaceToView(self.contentView,170)
    .leftSpaceToView(self.contentView,0)
    .rightSpaceToView(self.contentView,0)
    .heightIs(0.5);
    // 取消按钮
    self.cancelBtn.sd_layout
    .topSpaceToView(self.contentView,182)
    .leftSpaceToView(self.contentView,208)
    .rightSpaceToView(self.contentView,97)
    .heightIs(27).widthIs(70);
    // 再来一单按钮
    self.againBtn.sd_layout
    .topSpaceToView(self.contentView,182)
    .leftSpaceToView(self.contentView,293)
    .rightSpaceToView(self.contentView,12)
    .heightIs(27).widthIs(70);
}
// 用户头像
- (UIImageView *)userImg
{
    if (!_userImg)
    {
        _userImg = [[UIImageView alloc]init];
        _userImg.backgroundColor = [UIColor yellowColor];
    }
    return _userImg;
}
// 商家名称
- (UILabel *)diner_name
{
    if (!_diner_name)
    {
        _diner_name = [[UILabel alloc]init];
        _diner_name.backgroundColor = [UIColor yellowColor];
    }
    return _diner_name;
}
// 订单状态
- (UILabel *)order_status
{
    if (!_order_status)
    {
        _order_status = [[UILabel alloc]init];
        _order_status.backgroundColor = [UIColor yellowColor];
    }
    return _order_status;
}
// 商品
- (UILabel *)goods_one
{
    if (!_goods_one)
    {
        _goods_one = [[UILabel alloc]init];
        _goods_one.backgroundColor = [UIColor yellowColor];
    }
    return _goods_one;
}

- (UILabel *)goods_two
{
    if (!_goods_two)
    {
        _goods_two = [[UILabel alloc]init];
        _goods_two.backgroundColor = [UIColor yellowColor];
    }
    return _goods_two;
}

- (UILabel *)goods_three
{
    if (!_goods_three)
    {
        _goods_three = [[UILabel alloc]init];
        _goods_three.backgroundColor = [UIColor yellowColor];
    }
    return _goods_three;
}
// 商品数量
- (UILabel *)count_one
{
    if (!_count_one)
    {
        _count_one = [[UILabel alloc]init];
        _count_one.backgroundColor = [UIColor yellowColor];
    }
    return _count_one;
}

- (UILabel *)count_two
{
    if (!_count_two)
    {
        _count_two = [[UILabel alloc]init];
        _count_two.backgroundColor = [UIColor yellowColor];
    }
    return _count_two;
}

- (UILabel *)count_three
{
    if (!_count_three)
    {
        _count_three = [[UILabel alloc]init];
        _count_three.backgroundColor = [UIColor yellowColor];
    }
    return _count_three;
}
// 多出商品省略号
- (UILabel *)ellipsis
{
    if (!_ellipsis)
    {
        _ellipsis = [[UILabel alloc]init];
        _ellipsis.backgroundColor = [UIColor yellowColor];
    }
    return _ellipsis;
}
// 商品共计
- (UILabel *)total
{
    if (!_total)
    {
        _total = [[UILabel alloc]init];
        _total.backgroundColor = [UIColor yellowColor];
    }
    return _total;
}
// 商品总价
- (UILabel *)total_price
{
    if (!_total_price)
    {
        _total_price = [[UILabel alloc]init];
        _total_price.backgroundColor = [UIColor yellowColor];
    }
    return _total_price;
}
// 上分割线
- (UILabel *)divider_top
{
    if (!_divider_top)
    {
        _divider_top = [[UILabel alloc]init];
        _divider_top.backgroundColor = [UIColor lightGrayColor];
    }
    return _divider_top;
}
// 下分割线
- (UILabel *)divider_down
{
    if (!_divider_down)
    {
        _divider_down = [[UILabel alloc]init];
        _divider_down.backgroundColor = [UIColor yellowColor];
    }
    return _divider_down;
}
// 取消按钮
- (UIButton *)cancelBtn
{
    if (!_cancelBtn)
    {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelBtn.backgroundColor = [UIColor yellowColor];
        [_cancelBtn setTitleColor:[UIColor blackColor] forState:0];
    }
    return _cancelBtn;
}
// 再来一单按钮
- (UIButton *)againBtn
{
    if (!_againBtn)
    {
        _againBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _againBtn.backgroundColor = [UIColor yellowColor];
        [_againBtn setTitleColor:[UIColor blackColor] forState:0];
    }
    return _againBtn;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
