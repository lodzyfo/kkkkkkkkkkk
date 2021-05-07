//
//  OrderFromViewController.m
//  JackDeve
//
//  Created by 王奎卿 on 2017/5/9.
//  Copyright © 2017年 wkq. All rights reserved.
//

#import "OrderFromViewController.h"
#import "SGSegmentedControl.h"
#import "AllOrderFromViewController.h"
#import "EvaluateViewController.h"

@interface OrderFromViewController ()<SGSegmentedControlDelegate,UIScrollViewDelegate>
{
    AllOrderFromViewController *_oneVC1;
    EvaluateViewController *_twoVC2;
}
@property (nonatomic, strong) SGSegmentedControl *SG;
@property (nonatomic, strong) UIScrollView *orderScrollView;
@end

@implementation OrderFromViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加所有子控制器
    [self setupChildViewController];
    
    // 分段控制器
    [self segmentController];
    _oneVC1.allOrderV.hidden = YES;
    _twoVC2.view.hidden = NO;
}

- (void)segmentController
{
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *title_arr = @[@"全部订单",@"待评价"];
    
    _orderScrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _orderScrollView.contentSize = CGSizeMake(self.view.frame.size.width * title_arr.count, 0);
    _orderScrollView.backgroundColor = [UIColor clearColor];
    // 开启分页
    _orderScrollView.pagingEnabled = YES;
    // 没有弹簧效果
    _orderScrollView.bounces = NO;
    // 隐藏水平滚动条
    _orderScrollView.showsHorizontalScrollIndicator = NO;
    // 设置代理
    _orderScrollView.delegate = self;
    
    [self.view addSubview:_orderScrollView];
    
    self.SG = [SGSegmentedControl segmentedControlWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 44) delegate:self segmentedControlType:(SGSegmentedControlTypeStatic) titleArr:title_arr];
    //选中
    _SG.titleColorStateSelected =[UIColor blueColor];
    _SG.titleColorStateNormal =[UIColor grayColor];
    //下划线
    _SG.indicatorColor = [UIColor blueColor];
    //底部样式
    _SG.segmentedControlIndicatorType=SGSegmentedControlIndicatorTypeBottom;
    
    [self.view addSubview:_SG];
    
    _oneVC1 = [[AllOrderFromViewController alloc] init];
    [self.orderScrollView addSubview:_oneVC1.view];
    [self addChildViewController:_oneVC1];
}

- (void)SGSegmentedControl:(SGSegmentedControl *)segmentedControl didSelectBtnAtIndex:(NSInteger)index {
    // 1 计算滚动的位置
    CGFloat offsetX = index * self.view.frame.size.width;
    self.orderScrollView.contentOffset = CGPointMake(offsetX, 0);
    
    // 2.给对应位置添加对应子控制器
    [self showVc:index];
}

- (void)setupChildViewController {
    
    // 全部订单
    _oneVC1 = [[AllOrderFromViewController alloc] init];
    [self addChildViewController:_oneVC1];

    //待评价
    _twoVC2 = [[EvaluateViewController alloc]init];
    [self addChildViewController:_twoVC2];
    
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

// 显示控制器的view
- (void)showVc:(NSInteger)index {
    
    CGFloat offsetX = index * self.view.frame.size.width;
    
    UIViewController *vc = self.childViewControllers[index];
    
//    if (index == 0)
//    {
//        _twoVC2.tableView.hidden = YES;
//        _oneVC1.tableView.hidden = NO;
//    }
//    if (index == 1)
//    {
//        _oneVC1.tableView.hidden = YES;
//        _twoVC2.tableView.hidden = NO;
//    }
    
    // 判断控制器的view有没有加载过,如果已经加载过,就不需要加载
    if (vc.isViewLoaded) return;
    
    [self.view addSubview:vc.view];
    vc.view.frame = CGRectMake(offsetX, 0, self.view.frame.size.width, self.view.frame.size.height);
}

@end
