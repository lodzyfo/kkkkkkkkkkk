//
//  PreferentialCell.m
//  JackDeve
//
//  Created by 王奎卿 on 2017/5/9.
//  Copyright © 2017年 wkq. All rights reserved.
//

#import "PreferentialCell.h"
#import <SDAutoLayout.h>

@implementation PreferentialCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self preferentialCellShiPei];
    }
    return self;
}

- (void)preferentialCellShiPei
{
    [self.contentView addSubview:self.goodsView];
    [self.contentView addSubview:self.goodsName];
    [self.contentView addSubview:self.dinnerName];
    [self.contentView addSubview:self.prefer];
    [self.contentView addSubview:self.goodsPrice];
    [self.contentView addSubview:self.snapBtn];
    
    self.goodsView.sd_layout.leftSpaceToView(self.contentView,10).topSpaceToView(self.contentView,10).widthIs(100).heightIs(100);
    
    self.goodsName.sd_layout.leftSpaceToView(self.goodsView,15).topSpaceToView(self.contentView,18).heightIs(22).widthIs(200);
    
    self.dinnerName.sd_layout.leftSpaceToView(self.goodsView,15).topSpaceToView(self.goodsName,4).heightIs(18).widthIs(200);
    
    self.prefer.sd_layout.leftSpaceToView(self.goodsView,15).topSpaceToView(self.dinnerName,15).heightIs(17).widthIs(64);
    
    self.goodsPrice.sd_layout.leftSpaceToView(self.prefer,0).topSpaceToView(self.dinnerName,8).heightIs(28);
    
    self.snapBtn.sd_layout.rightSpaceToView(self.contentView,10).bottomSpaceToView(self.contentView,15).widthIs(80).heightIs(30);
}

- (UIImageView *)goodsView
{
    if (!_goodsView)
    {
        _goodsView = [[UIImageView alloc]init];
    }
    return _goodsView;
}

- (UILabel *)goodsName
{
    if (!_goodsName)
    {
        _goodsName = [[UILabel alloc]init];
        _goodsName.font = [UIFont systemFontOfSize:20];
        _goodsName.font = [UIFont boldSystemFontOfSize:20];
    }
    return _goodsName;
}

- (UILabel *)dinnerName
{
    if (!_dinnerName)
    {
        _dinnerName = [[UILabel alloc]init];
        _dinnerName.textColor = [UIColor grayColor];
        _dinnerName.font = [UIFont systemFontOfSize:16];
    }
    return _dinnerName;
}

- (UILabel *)prefer
{
    if (!_prefer)
    {
        _prefer = [[UILabel alloc]init];
        
        _prefer.text = @"优惠价 ￥";
        _prefer.textColor = [UIColor colorWithRed: 251/255.0 green: 78/255.0 blue: 68/255.0 alpha:1.0];
        _prefer.font = [UIFont systemFontOfSize:17];
        _prefer.font = [UIFont boldSystemFontOfSize:14];
    }
    return _prefer;
}

- (UILabel *)goodsPrice
{
    if (!_goodsPrice)
    {
        _goodsPrice = [[UILabel alloc]init];
        _goodsPrice.textColor = [UIColor redColor];
        _goodsPrice.textColor = [UIColor colorWithRed: 251/255.0 green: 78/255.0 blue: 68/255.0 alpha:1.0];
        
        _goodsPrice.font = [UIFont systemFontOfSize:23];
        _goodsPrice.font = [UIFont boldSystemFontOfSize:23];
    }
    return _goodsPrice;
}

- (UIButton *)snapBtn
{
    if (!_snapBtn)
    {
        _snapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _snapBtn.layer.cornerRadius = 5;
        _snapBtn.layer.masksToBounds = YES;
        
        [_snapBtn setTitle:@"立即抢购" forState:0];
        [_snapBtn setTitleColor:[UIColor whiteColor] forState:0];
        _snapBtn.backgroundColor = [UIColor redColor];
        _snapBtn.backgroundColor = [UIColor colorWithRed: 251/255.0 green: 78/255.0 blue: 68/255.0 alpha:1.0];
        _snapBtn.font = [UIFont boldSystemFontOfSize:16];
    }
    return _snapBtn;
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
