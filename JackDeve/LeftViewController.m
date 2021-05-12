//
//  LeftViewController.m
//  JackDeve
//
//  Created by apple on 17/5/9.
//  Copyright © 2017年 wkq. All rights reserved.
//
#define CELL_HEIGHT 75
#define LEFTWIDTH [UIScreen mainScreen].bounds.size.width / 3 * 2
#import "LeftViewController.h"
#import "Leftview.h"
#import "HeaderFile.h"
#import "HomeUserDefault.h"
#import <SDWebImage/UIButton+WebCache.h>
@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    Leftview * v;
    Data *_model;
    
}

@property (nonatomic, copy) NSArray *titleArr;
@property (nonatomic, copy) NSArray *imgArr;
@end

@implementation LeftViewController



- (void)viewWillAppear:(BOOL)animated {
    if (!self.navigationController.navigationBar.isHidden) {
        self.navigationController.navigationBarHidden = YES;
    }
    // 取用户本地信息
    Data *model = [HomeUserDefault getUserDefault];
    _model = model;
    v.nameLbl.text = _model.user_name ? _model.user_name : @"登录";
    if (_model.avatar.length == 0) {
        [v.headerBtn setBackgroundImage:[UIImage imageNamed:@"avatar_default"] forState:UIControlStateNormal];
    } else {
        [v.headerBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:_model.avatar] forState:UIControlStateNormal];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
   v =[[Leftview alloc]initWithFrame:self.view.frame];
    self.view =v;
    //设置代理
    v.table.delegate =self;
    v.table.dataSource =self;
     self.view.backgroundColor =[UIColor whiteColor];
     [v.headerBtn addTarget:self action:@selector(imgClick) forControlEvents:UIControlEventTouchUpInside];
    _titleArr = @[@"订单",@"余额",@"地址"];
    _imgArr   = @[@"left_dingdan",@"left_yu_e",@"left_address"];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    // 取消选中状态
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.textLabel.text  = _titleArr[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:_imgArr[indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CELL_HEIGHT;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 收回抽屉视图
    [self.viewDeckController closeSide:YES];
    
    if (self.pushBlock != nil) {
        self.pushBlock(indexPath.row);
    }
    
   
}

#pragma mark - Action
- (void)imgClick {
    // 收回抽屉视图
    [self.viewDeckController closeSide:YES];
    if (self.imgBlock != nil) {
        self.imgBlock(YES);
    }
   
}


@end
