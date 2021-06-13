//
//  AccountView.m
//  JackDeve
//
//  Created by apple on 17/5/10.
//  Copyright © 2017年 wkq. All rights reserved.
//

#import "AccountView.h"

@implementation AccountView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.table];
        [self addSubview:self.logOutBtn];
        
    }
    
    return self;
    
}

- (UITableView *)table {
    if (_table==nil) {
        _table            = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];

        _table.backgroundView = nil;
        _table.backgroundColor = [UIColor colorWithRed:(246/255.0) green:(246/255.0) blue:(246/255.0) alpha:1];
    }
    return _table;
}

-(UIButton *)logOutBtn{
    if (_logOutBtn ==nil) {
        _logOutBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT -60 , SCREEN_WIDTH, 60)];
        [_logOutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [_logOutBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_logOutBtn setBackgroundColor:[UIColor whiteColor]];
      
        
    }
    return _logOutBtn;
    
    
}


@end
