//
//  XDLoginHeaderView.m
//  OceanDecorationUserEdition
//
//  Created by iCode on 2016/11/17.
//  Copyright © 2016年 iCode. All rights reserved.
//

#import "XDLoginHeaderView.h"

#import "Masonry.h"

@implementation XDLoginHeaderView

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
    _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Page 1"]];
    [self addSubview:_imageView];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mas_left).with.offset(SCREEN_WIDTH / 5);
        make.top.equalTo(self.mas_top).with.offset((SCREEN_HEIGHT / 4 - SCREEN_WIDTH / 5 * 3 * _imageView.image.size.height / _imageView.image.size.width) / 2);
        make.right.equalTo(self.mas_right).with.offset(- SCREEN_WIDTH / 5);
        make.height.mas_offset(SCREEN_WIDTH / 5  * 3 * _imageView.image.size.height / _imageView.image.size.width);
    }];
}

@end
