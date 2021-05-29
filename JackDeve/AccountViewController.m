//
//  AccountViewController.m
//  JackDeve
//
//  Created by apple on 17/5/9.
//  Copyright © 2017年 wkq. All rights reserved.
//

#import "AccountViewController.h"

@interface AccountViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    AccountView * v;
    UIImageView *_img;
    Data *_model;
    NSDictionary * _dic;
}
@property (nonatomic, copy) NSArray *Arr1;
@property (nonatomic, strong) NSMutableArray *Arr2;
@end

@implementation AccountViewController
-(void)viewWillAppear:(BOOL)animated{
    Data *model = [HomeUserDefault getUserDefault];
    _model = model;
    self.Arr1 = @[@"头像",@"用户名",@"密码"];
    if (_model.user_name == nil) {
        self.Arr2 = [NSMutableArray arrayWithObjects:@"",@"",@"修改", nil];
    } else {
        self.Arr2 = [NSMutableArray arrayWithObjects:@"",_model.user_name,@"修改", nil];
    }
    [v.table reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    //创建一个添加按钮
    UIButton *navLeftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 5, 20, 20)];
    [navLeftBtn setBackgroundImage:[UIImage imageNamed:@"左箭头"] forState:UIControlStateNormal];
    [navLeftBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:navLeftBtn];
    v =[[AccountView alloc]initWithFrame:self.view.frame];
    self.view =v;
    v.table.delegate=self;
    v.table.dataSource =self;
    
    self.title =@"账户";
      [v.logOutBtn addTarget:self action:@selector(logOut) forControlEvents:UIControlEventTouchUpInside];
}


//返回方法
-(void)click
{
    [self.navigationController popViewControllerAnimated:YES];

}
#pragma mark - UITableVIewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.Arr1.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"accountCell";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    // 单元格右边的箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    // 取消选中状态
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    if (indexPath.row == 0) {
        _img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 55, 55)];
        if (_model.avatar.length == 0) {
            _img.image = [UIImage imageNamed:@"avatar_default"];
        } else {
            [_img sd_setImageWithURL:[NSURL URLWithString:_model.avatar]];
        }
        _img.layer.cornerRadius  = 55 /2;
        _img.layer.masksToBounds = YES;
        cell.accessoryView       = _img;
    }
    
    cell.textLabel.text       = self.Arr1[indexPath.row];
    cell.detailTextLabel.text = self.Arr2[indexPath.row];
    return cell;
}

#pragma mark - UITableVIewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}
- (void)logOut {
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"提示" message:@"您确定要退出当前账号吗?" preferredStyle:UIAlertControllerStyleAlert];
    [alertC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alertC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //请求数据
        [[AccountModel showData]getDataAndBlock:^(NSDictionary *mydic) {
            _dic = mydic;
            [self LoginHttpFinish];
        }];

    }]];
    [self presentViewController:alertC animated:YES completion:nil];
}

- (void)LoginHttpFinish
{
    if ([[_dic objectForKey:@"errmsg"] isEqualToString:@"success"]) {
        // 删除本地信息
        [HomeUserDefault deleteAllData];
        dispatch_async(dispatch_get_main_queue(), ^{
             [self.navigationController popViewControllerAnimated:YES];
        });
    }
    else{
        // 退出失败
        [SVProgressHUD showErrorWithStatus:@"退出失败" ];
        [SVProgressHUD dismissWithDelay:1.5];
    }
}

@end
