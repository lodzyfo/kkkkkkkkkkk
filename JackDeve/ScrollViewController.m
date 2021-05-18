//
//  ScrollViewController.m
//  JackDeve
//
//  Created by apple on 17/5/9.
//  Copyright © 2017年 wkq. All rights reserved.
//

#import "ScrollViewController.h"
#import "SGSegmentedControl.h"
#import "MainViewController.h"
#import "BreakfastBars.h"
#import "BuffetCar.h"
#import "PrivilegeController.h"
#import "HeaderFile.h"

@interface ScrollViewController ()<UIScrollViewDelegate, SGSegmentedControlDelegate>
@property (nonatomic, strong) SGSegmentedControl *SG;
@property (nonatomic, strong) UIScrollView *mainScrollView;
@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    self.navigationItem.title =@"阳光快车";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.barTintColor=[UIColor whiteColor];
    //创建一个添加按钮
    UIButton *navLeftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 5, 20, 20)];
    [navLeftBtn setBackgroundImage:[UIImage imageNamed:@"user"] forState:UIControlStateNormal];
    [navLeftBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:navLeftBtn];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 1.添加所有子控制器
    [self setupChildViewController];
    
    [self setupSegmentedControl];
}

-(void)click
{
    
  [self.viewDeckController openSide:IIViewDeckSideLeft animated:YES];
    
}

- (void)setupSegmentedControl {
    
    NSArray *title_arr = @[@"全部", @"早餐店",@"餐车",@"优惠"];
    
    // 创建底部滚动视图
    self.mainScrollView = [[UIScrollView alloc] init];
    
    _mainScrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width * title_arr.count, 0);
    _mainScrollView.backgroundColor = [UIColor clearColor];
    // 开启分页
    _mainScrollView.pagingEnabled = YES;
    // 没有弹簧效果
    _mainScrollView.bounces = NO;
    // 隐藏水平滚动条
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    // 设置代理
    _mainScrollView.delegate = self;
    
    [self.view addSubview:_mainScrollView];
    
    
    self.SG = [SGSegmentedControl segmentedControlWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 44) delegate:self segmentedControlType:(SGSegmentedControlTypeStatic) titleArr:title_arr];
    //选中
    _SG.titleColorStateSelected =[UIColor blueColor];
    _SG.titleColorStateNormal =[UIColor grayColor];
    //下划线
    _SG.indicatorColor =[UIColor blueColor];;
    //底部样式
    _SG.segmentedControlIndicatorType=SGSegmentedControlIndicatorTypeBottom;
    [self.view addSubview:_SG];
    
    // 推荐
    MainViewController *oneVC1 = [[MainViewController alloc] init];
    [self.mainScrollView addSubview:oneVC1.view];
    [self addChildViewController:oneVC1];
    
    
}
- (void)SGSegmentedControl:(SGSegmentedControl *)segmentedControl didSelectBtnAtIndex:(NSInteger)index {
    // 1 计算滚动的位置
    CGFloat offsetX = index * self.view.frame.size.width;
    self.mainScrollView.contentOffset = CGPointMake(offsetX, 0);
    
    // 2.给对应位置添加对应子控制器
    [self showVc:index];
}
// 添加所有子控制器
- (void)setupChildViewController {
    
    // 推荐
    MainViewController *oneVC1 = [[MainViewController alloc] init];
    //    [self.mainScrollView addSubview:oneVC1.view];
    [self addChildViewController:oneVC1];
    // 手游
    BreakfastBars *oneVC = [[BreakfastBars alloc] init];
    //    [self.mainScrollView addSubview:oneVC.view];
    [self addChildViewController:oneVC];
    
    
    BuffetCar *oneVC2 = [[BuffetCar alloc] init];
    //    [self.mainScrollView addSubview:oneVC.view];
    [self addChildViewController:oneVC2];
    
    PrivilegeController *oneVC3 = [[PrivilegeController alloc] init];
    //    [self.mainScrollView addSubview:oneVC.view];
    [self addChildViewController:oneVC3];
    
    
    
}

// 显示控制器的view
- (void)showVc:(NSInteger)index {
    
    CGFloat offsetX = index * self.view.frame.size.width;
    
    UIViewController *vc = self.childViewControllers[index];
    
    // 判断控制器的view有没有加载过,如果已经加载过,就不需要加载
    if (vc.isViewLoaded) return;
    
    [self.mainScrollView addSubview:vc.view];
    vc.view.frame = CGRectMake(offsetX, 0, self.view.frame.size.width, self.view.frame.size.height);
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    // 计算滚动到哪一页
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    // 1.添加子控制器view
    [self showVc:index];
    // 2.把对应的标题选中
    [self.SG titleBtnSelectedWithScrollView:scrollView];
    
}
// 让屏幕一直横屏显示
- (BOOL)shouldAutorotate

{
    
    return NO;
    
}
- (void)setIndex:(NSInteger)index {
    switch (index) {
        case 0: {    // 订单
            [self.navigationController pushViewController:[OrderFromViewController new] animated:NO];
            // 取用户本地信息
//          LoginModel *model = [HomeUserDefault getUserDefault];
//          if (model.token) {
//            dispatch_async(dispatch_get_main_queue(), ^{
//                 [self.navigationController pushViewController:[OrderFromViewController new] animated:NO];
//            });
//            } else {
//            [SVProgressHUD showErrorWithStatus:@"请您登录"];
//            [SVProgressHUD dismissWithDelay:1];
//          LoginViewController *loginVc = [[LoginViewController alloc] init];
//            //loginVc.push = YES;
//        [self.navigationController pushViewController:loginVc animated:YES];
//                        }
        }
            break;
        case 1: {    // 余额
            // 取用户本地信息
            LoginModel *model = [HomeUserDefault getUserDefault];
            if (model.token) {
                dispatch_async(dispatch_get_main_queue(), ^{
                   [self.navigationController pushViewController:[BalanceViewController new] animated:NO];
                });
                
            } else {
                [SVProgressHUD showErrorWithStatus:@"请您登录"];
                 [SVProgressHUD dismissWithDelay:1];
                LoginViewController *loginVc = [[LoginViewController alloc] init];
                // loginVc.push = YES;
                [self.navigationController pushViewController:loginVc animated:YES];
            }
        }
            
            
            break;
        case 2:  {    // 地址
            // 取用户本地信息
            LoginModel *model = [HomeUserDefault getUserDefault];
            if (model.token) {
                dispatch_async(dispatch_get_main_queue(), ^{
                   [self.navigationController pushViewController:[AddressViewController new] animated:NO];
                });
                
            } else {
                [SVProgressHUD showErrorWithStatus:@"请您登录"];
                [SVProgressHUD dismissWithDelay:1];
                LoginViewController *loginVc = [[LoginViewController alloc] init];
                //loginVc.push = YES;
                [self.navigationController pushViewController:loginVc animated:YES];
            }
        }
            break;
            
        default:
            break;
    }
}

// 点击用户头像跳转
- (void)setPush:(BOOL)push {
    LoginModel *model = [HomeUserDefault getUserDefault];
    if (model.token) {
        AccountViewController *accountVc = [[AccountViewController alloc] init];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.navigationController pushViewController:accountVc animated:YES];
        });
        
        
    } else {
        
        LoginViewController *login = [[LoginViewController alloc] init];
        //        login.push = YES;
        [self.navigationController pushViewController:login animated:NO];
    }
}


@end
