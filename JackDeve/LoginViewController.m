//
//  LoginViewController.m
//  JackDeve
//
//  Created by apple on 17/5/9.
//  Copyright © 2017年 wkq. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
@interface LoginViewController ()<UITextFieldDelegate>
{
    LoginView * v;
    NSMutableDictionary *_dic;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    
    //创建一个添加按钮
    UIButton *navLeftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 5, 20, 20)];
    [navLeftBtn setBackgroundImage:[UIImage imageNamed:@"左箭头"] forState:UIControlStateNormal];
    [navLeftBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:navLeftBtn];
    
    
    v =[[LoginView alloc]initWithFrame:self.view.frame];
    self.view =v;
    self.view.backgroundColor= [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    //设置代理
    v.phoneNumberTextField.delegate =self;
    v.codeTextField.delegate =self;
    self.title =@"登录";
    //忘记密码点击方法
            [v.forGetPassWordBtn addTarget:self action:@selector(forGetPassWordBtn1) forControlEvents:UIControlEventTouchUpInside];
    
    //注册点击方法
       [v.registerBtn addTarget:self action:@selector(registerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    //点击登录
     [v.loginBtn addTarget:self action:@selector(loginBtnSelected:) forControlEvents:UIControlEventTouchUpInside];
    
}

//返回方法
-(void)click
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

//隐藏键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [v.phoneNumberTextField resignFirstResponder];
    
    [v.codeTextField resignFirstResponder];
}


//忘记密码
-(void)forGetPassWordBtn1{
    ForgetPasswordViewController * VC =[[ForgetPasswordViewController alloc]init];
    UINavigationController * NVC =[[UINavigationController alloc]initWithRootViewController:VC];
    [self presentViewController:NVC animated:YES completion:nil];
    
}

//用户注册
- (void)registerBtnClick
{
    RegisterViewController *registerVC = [[RegisterViewController alloc]init];
    UINavigationController * NVC =[[UINavigationController alloc]initWithRootViewController:registerVC];
    [self presentViewController:NVC animated:YES completion:nil];
}
//登录
- (void)loginBtnSelected:(UIButton *)btn
{
    BOOL isPhoneNumber = [XDTools isMobileNumber:v.phoneNumberTextField.text];
    
    if (isPhoneNumber) {
        
        
        if (v.codeTextField.text.length != 0) {
            
            [self LoginHttp];
        }
        else
        {
            [self.view makeToast:@"请输入密码" duration:0.5f position:CSToastPositionCenter];
        }
        //        }
        
    }
    else
    {
        [self.view makeToast:@"请输入正确的手机号码" duration:0.5f position:CSToastPositionCenter];
    }
}

//登录请求
- (void)LoginHttp
{
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:[NSString stringWithFormat:denglu,v.phoneNumberTextField.text,v.codeTextField.text]] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        _dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
       
        
        [self LoginHttpFinish];
        
    }] resume];
    
   
    
}


- (void)LoginHttpFinish
{
    if ([[_dic objectForKey:@"errmsg"] isEqualToString:@"手机号错误"]) {
        NSLog(@"手机号错误");
    }else if ([[_dic objectForKey:@"errmsg"] isEqualToString:@"用户密码错误"])
    {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            UIAlertController *alet = [UIAlertController alertControllerWithTitle:@"提示" message:@"密码输入错误" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *act1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            UIAlertAction *act2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            }];
            [alet addAction:act1];
            [alet addAction:act2];
            [self presentViewController:alet animated:YES completion:nil];
        });
    }
    else if([[_dic objectForKey:@"errmsg"] isEqualToString:@"用户不存在"]){
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertController *alet = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户不存在" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *act1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            UIAlertAction *act2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            }];
            [alet addAction:act1];
            [alet addAction:act2];
            [self presentViewController:alet animated:YES completion:nil];
        });
    }
    else if ([_dic objectForKey:@"errmsg"] == nil)
    {
        NSLog(@"登录成功");
        
        DengLu * m=[[DengLu alloc]init];
        
        [m yy_modelSetWithDictionary:_dic];
        
        // 本地存储
        [HomeUserDefault userDefaultWithModel:m.data];
        NSLog(@"您的token:%@",m.data.token);

        
        dispatch_async(dispatch_get_main_queue(), ^{
          [self.navigationController popViewControllerAnimated:YES];
            
        });
      
    }
}





@end
