//
//  XDRegisterFooderView.m
//  OceanDecorationUserEdition
//
//  Created by iCode on 2016/11/22.
//  Copyright © 2016年 iCode. All rights reserved.
//

#import "XDRegisterFooderView.h"
#import "Masonry.h"

@implementation XDRegisterFooderView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    self.backgroundColor = [UIColor whiteColor];
    
 

    
    _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _registerBtn.backgroundColor = [UIColor colorWithRed:55.0/255.0 green:154.0/255.0 blue:12.0/255.0 alpha:1];
    _registerBtn.layer.masksToBounds = YES;
    _registerBtn.layer.cornerRadius = SCREEN_HEIGHT / 16 / 2;
    [_registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self addSubview:_registerBtn];
    
    _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_loginBtn setTitleColor:[UIColor colorWithRed:55.0/255.0 green:154.0/255.0 blue:12.0/255.0 alpha:1] forState:UIControlStateNormal];
   
    _loginBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    _loginBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self addSubview:_loginBtn];
    
   
    
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mas_left).with.offset(15);
        make.top.equalTo(self.mas_top).with.offset(15);
        make.right.equalTo(self.mas_right).with.offset(-15);
        make.height.mas_offset(SCREEN_HEIGHT / 16);
    }];
    
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mas_left).with.offset(15);
        make.top.equalTo(self.registerBtn.mas_bottom).with.offset(15);
        make.width.mas_offset(50);
        make.height.mas_offset(20);
    }];
    
}

@end
