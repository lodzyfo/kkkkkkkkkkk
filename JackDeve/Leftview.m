//
//  Leftview.m
//  JackDeve
//
//  Created by apple on 17/5/9.
//  Copyright © 2017年 wkq. All rights reserved.
//
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#import "Leftview.h"
#import <SDAutoLayout.h>
#define CELL_HEIGHT 75
#define LEFTWIDTH [UIScreen mainScreen].bounds.size.width / 3 * 2
@implementation Leftview
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.table];
        [self addSubview:self.headerView];
        [self.headerView addSubview:self.headerBtn];
        
        [self.headerView addSubview:self.nameLbl];
        [self addSubview:self.zmBtn];
        
        self.headerView.sd_layout
        .leftSpaceToView(self, 0)
        .topSpaceToView(self, CELL_HEIGHT)
        .widthIs(LEFTWIDTH)
        .heightIs(120)
        ;
        
        self.headerBtn.sd_layout
        .centerXEqualToView(self)
        .topSpaceToView(self.headerView, 10)
        .widthIs([UIScreen mainScreen].bounds.size.width*0.183908)
        .heightIs([UIScreen mainScreen].bounds.size.height*0.1048492)
        ;
        
        self.nameLbl.sd_layout
        .centerXEqualToView(self.headerBtn)
        .topSpaceToView(self.headerBtn,10)
        .widthIs(LEFTWIDTH)
        .heightIs(25)
        ;
        
    }
    
    return self;
    
}
-(UITableView *)table{
    if (_table==nil) {
        _table                = [[UITableView alloc] initWithFrame:CGRectMake(20, 200, LEFTWIDTH - 20, CELL_HEIGHT * 3)];
        _table.backgroundColor =[UIColor whiteColor];
        
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;  // 取消分割线
        _table.scrollEnabled  = NO; // 取消上下滑动效果
    }
    return _table;
}
- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] init];
    }
    return _headerView;
}

- (UIButton *)headerBtn {
    if (!_headerBtn) {
        // 头像
        _headerBtn = [[UIButton alloc] init];
        _headerBtn.layer.cornerRadius  = [UIScreen mainScreen].bounds.size.width*0.183908/2;
        _headerBtn.layer.masksToBounds = YES;
       
    }
    return _headerBtn;
}



- (UILabel *)nameLbl {
    if (!_nameLbl) {
        // 名字
        _nameLbl = [[UILabel alloc] init];
        _nameLbl.textAlignment   = NSTextAlignmentCenter;
        _nameLbl.font            = [UIFont systemFontOfSize:20];
    }
    return _nameLbl;
}

- (UIButton *)zmBtn {
    if (!_zmBtn) {
        // 招募联盟
        CGFloat size = LEFTWIDTH / SCREEN_WIDTH;
        _zmBtn = [[UIButton alloc] initWithFrame:CGRectMake((LEFTWIDTH - 200 * size) /2, SCREEN_HEIGHT - 70, 200 * size, 50)];
        [_zmBtn setImage:[UIImage imageNamed:@"lianmeng" ]forState:UIControlStateNormal];
        [_zmBtn setTitle:@"招募联盟" forState:UIControlStateNormal];
        [_zmBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _zmBtn.layer.cornerRadius  = 25;
        _zmBtn.layer.masksToBounds = YES;
        _zmBtn.layer.borderColor   = [UIColor colorWithRed:(173/255.0) green:(173/255.0) blue:(173/255.0) alpha:1].CGColor;
        _zmBtn.layer.borderWidth   = 1;
        _zmBtn.imageEdgeInsets     = UIEdgeInsetsMake(0, 0, 0, 15);    // 图片距离文字的距离
    }
    return _zmBtn;
}



@end
