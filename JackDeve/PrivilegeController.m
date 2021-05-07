//
//  PrivilegeController.m
//  JackDeve
//
//  Created by apple on 17/5/9.
//  Copyright © 2017年 wkq. All rights reserved.
//

#import "PrivilegeController.h"
#import "PreferentialData.h"
#import "PreferentialCell.h"
#import "PreferentialModel.h"
#import <UIImageView+WebCache.h>

@interface PrivilegeController ()<PreferentialDataDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation PrivilegeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //  展示优惠界面
    [self showPreferentialVC];
    
    // 表格展示
    [self showtableView];
}

- (void)showPreferentialVC
{
    preferentialData(@"preferential").delegate = self;
    [preferentialData(@"preferential") getPreferentialData:@"http://daohe.apic.1by1.cc/index/promotions?page_id=1&lng=116.490667&lat=39.906133"];
}

- (void)showtableView
{
    self.tableView = ({
    
        CGSize size = [UIScreen mainScreen].bounds.size;
        
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 110, size.width, size.height) style:UITableViewStylePlain];
        
        tableView.delegate = self;
        
        tableView.dataSource = self;
        
        tableView;
    });
    
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:self.tableView];
}

- (void)jsonData:(NSMutableArray *)array
{
    self.array = array;
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseId = @"1502";
    
    PreferentialCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (!cell)
    {
        cell = [[PreferentialCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
    }
    PreferentialModel *model = _array[indexPath.row];
    
    [cell.goodsView sd_setImageWithURL:[NSURL URLWithString:model.goods_pic]];
    cell.goodsName.text = model.goods_name;
    cell.goodsPrice.text = model.goods_price;
    cell.dinnerName.text = model.diner_name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

@end
