//
//  MainViewController.m
//  JackDeve
//
//  Created by apple on 17/5/9.
//  Copyright © 2017年 wkq. All rights reserved.


#import "MainViewController.h"
#import "HeaderFile.h"

@interface MainViewController ()<MAMapViewDelegate>


{
    MAMapView *_theMapView;
}
    
    
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _theMapView = [[MAMapView alloc]initWithFrame:self.view.frame];
   
    //显示用户位置
    _theMapView.mapType =MAMapTypeStandard;
    
    //定位用户位置的模式
    _theMapView.userTrackingMode = MAUserTrackingModeFollow;
    //显示比例尺
    _theMapView.showsScale = YES;
    _theMapView.scaleOrigin = CGPointMake(_theMapView.scaleOrigin.x, SCREEN_HEIGHT-50);
    
    //显示指南针
    _theMapView.showsCompass = YES;
    _theMapView.compassOrigin = CGPointMake(_theMapView.compassOrigin.x,114);
    
    _theMapView.delegate = self;

    [self.view addSubview:_theMapView];
    
}

-(MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation{
//    if ([annotation isKindOfClass:[MAPointAnnotation class]]){
        static NSString *reuseIndetifier = @"annotationReuseIndetifier";
        MAAnnotationView *annotationView = (MAAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
        if (annotationView == nil){
            annotationView = [[MAAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIndetifier];
        }
        annotationView.image = [UIImage imageNamed:@"定位标签"];
        //设置中心点偏移，使得标注底部中间点成为经纬度对应点
//        annotationView.centerOffset = CGPointMake(38.122647, 116.209161);
        return annotationView;
//    }
//    return nil;
}




@end
