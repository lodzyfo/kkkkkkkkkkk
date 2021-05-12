//
//  LoginView.m
//  JackDeve
//
//  Created by apple on 17/5/9.
//  Copyright © 2017年 wkq. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
          [self addSubview:self.logoImageView];
        [self addSubview:self.phoneNumberTextField];
        [self addSubview:self.codeTextField];
        [self addSubview:self.loginBtn];
        
        [self addSubview:self.forGetPassWordBtn];
        [self addSubview:self.registerBtn];
       
        
    }
    
    return self;
    
}

-(XDLoginHeaderView *)logoImageView{
    if (_logoImageView==nil) {
        _logoImageView = [[XDLoginHeaderView alloc]initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_HEIGHT / 4)];
    }
    return _logoImageView;
}

-(UITextField *)phoneNumberTextField{
    if (_phoneNumberTextField==nil) {
        
        _phoneNumberTextField = [[UITextField alloc]initWithFrame:CGRectMake(15, self.logoImageView.frame.size.height+100, SCREEN_WIDTH - 30, SCREEN_HEIGHT / 16)];
        
        
        //设置提示文字字体颜色
       _phoneNumberTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入手机号" attributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1]}];
        _phoneNumberTextField.keyboardType = UIKeyboardTypeNumberPad;
        _phoneNumberTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _phoneNumberTextField.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon1_11"]];
        _phoneNumberTextField.leftViewMode = UITextFieldViewModeAlways;
        _phoneNumberTextField.textColor = [UIColor blackColor];
        _phoneNumberTextField.backgroundColor=[UIColor whiteColor];
        
    }
    return _phoneNumberTextField;
}

-(UITextField *)codeTextField{
    
    if (_codeTextField==nil) {
        _codeTextField = [[UITextField alloc]initWithFrame:CGRectMake(15, self.logoImageView.frame.size.height + _phoneNumberTextField.frame.size.height+100, SCREEN_WIDTH - 30, SCREEN_HEIGHT / 16)];
        //设置提示文字字体颜色
        _codeTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入密码" attributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1]}];
                //    _codeTextField.keyboardType = UIKeyboardTypeNumberPad;
        _codeTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _codeTextField.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon10_03"]];
        _codeTextField.leftViewMode = UITextFieldViewModeAlways;
        _codeTextField.textColor = [UIColor blackColor];
        _codeTextField.secureTextEntry=NO;
         _codeTextField.backgroundColor=[UIColor whiteColor];
    }
    return _codeTextField;
    
}

-(UIButton *)loginBtn{
    if (_loginBtn==nil) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.frame = CGRectMake(15, self.logoImageView.frame.size.height + _phoneNumberTextField.frame.size.height + _codeTextField.frame.size.height + 20+100, SCREEN_WIDTH - 30, SCREEN_HEIGHT / 16);
        _loginBtn.backgroundColor = [UIColor colorWithRed:233.0/255.0 green:110.0/255.0 blue:8.0/255.0 alpha:1];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.layer.masksToBounds = YES;
        _loginBtn.layer.cornerRadius  = 6 ;
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return _loginBtn;
    
}
-(UIButton *)forGetPassWordBtn{
    if (_forGetPassWordBtn==nil) {
        _forGetPassWordBtn= [UIButton buttonWithType:UIButtonTypeCustom];
        _forGetPassWordBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-80, self.logoImageView.frame.size.height + _phoneNumberTextField.frame.size.height + _codeTextField.frame.size.height + 20 + _loginBtn.frame.size.height + 20+100, SCREEN_WIDTH / 6, 20);
        [_forGetPassWordBtn setTitleColor:[UIColor colorWithRed:233.0/255.0 green:110.0/255.0 blue:8.0/255.0 alpha:1] forState:UIControlStateNormal];
        [_forGetPassWordBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
        _forGetPassWordBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _forGetPassWordBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;


    }
    return _forGetPassWordBtn;
}
-(UIButton *)registerBtn{
    if (_registerBtn==nil) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _registerBtn.frame = CGRectMake(15, self.logoImageView.frame.size.height + _phoneNumberTextField.frame.size.height + _codeTextField.frame.size.height + 20 + _loginBtn.frame.size.height + 20+100, SCREEN_WIDTH / 6, 20);
        [_registerBtn setTitleColor:[UIColor colorWithRed:233.0/255.0 green:110.0/255.0 blue:8.0/255.0 alpha:1] forState:UIControlStateNormal];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
       
        _registerBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
     
        
    }
    return _registerBtn;
    
    
}

@end
