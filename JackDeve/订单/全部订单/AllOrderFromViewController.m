//
//  AllOrderFromViewController.m
//  JackDeve
//
//  Created by 王奎卿 on 2017/5/9.
//  Copyright © 2017年 wkq. All rights reserved.
//

#import "AllOrderFromViewController.h"
#import "OrderFromTableViewCell.h"

@interface AllOrderFromViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation AllOrderFromViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self showAllOrderView];
    
    self.allOrderV = self.view;
}

- (void)showAllOrderView
{
    // 对tableView进行包装
    CGSize size = [UIScreen mainScreen].bounds.size;
    self.tableView = ({
    
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, size.width, size.height) style:UITableViewStylePlain];
        
        tableView.delegate = self;
        
        tableView.dataSource = self;
        
        tableView;
    });
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseID = @"1111";
    
    OrderFromTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    
    if (!cell)
    {
        cell = [[OrderFromTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseID];
    }
    
    // 取消选中状态
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    [cell.cancelBtn setTitle:@"取消" forState:0];
    [cell.cancelBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)click
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 220;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
