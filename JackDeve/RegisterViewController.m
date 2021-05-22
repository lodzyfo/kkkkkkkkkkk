//
//  RegisterViewController.m
//  JackDeve
//
//  Created by apple on 17/5/9.
//  Copyright © 2017年 wkq. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    
    //创建一个添加按钮
    UIButton *navLeftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 5, 20, 20)];
    [navLeftBtn setBackgroundImage:[UIImage imageNamed:@"左箭头"] forState:UIControlStateNormal];
    [navLeftBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:navLeftBtn];
    self.title =@"注册";
    
    
}
//返回方法
-(void)click
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


@end
