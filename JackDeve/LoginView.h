//
//  LoginView.h
//  JackDeve
//
//  Created by apple on 17/5/9.
//  Copyright © 2017年 wkq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIView


//手机号输入框
@property (nonatomic, strong) UITextField *phoneNumberTextField;

//密码输入框
@property (nonatomic, strong) UITextField *codeTextField;


//登录
@property (nonatomic, strong) UIButton *loginBtn;

//忘记密码
@property (nonatomic, strong) UIButton *forGetPassWordBtn;

//注册
@property (nonatomic, strong) UIButton *registerBtn;

@property (nonatomic , strong ) XDLoginHeaderView *logoImageView;
@end
