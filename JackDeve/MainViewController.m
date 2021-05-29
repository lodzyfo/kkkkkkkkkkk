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
    _theMapView.showsUserLocation = YES;
    //自定义定位小蓝点
    MAUserLocationRepresentation *nowLocation = [[MAUserLocationRepresentation alloc]init];
    nowLocation.image = [UIImage imageNamed:@"定位标签"];
    [_theMapView updateUserLocationRepresentation:nowLocation];
    
    //定位用户位置的模式     实时更新
    _theMapView.userTrackingMode = MAUserTrackingModeFollowWithHeading;
    //显示比例尺
    _theMapView.showsScale = YES;
    _theMapView.scaleOrigin = CGPointMake(_theMapView.scaleOrigin.x, SCREEN_HEIGHT-50);
    //地图标注
    _theMapView.showsLabels = YES;
    
    //显示指南针
    _theMapView.showsCompass = YES;
    _theMapView.compassOrigin = CGPointMake(_theMapView.compassOrigin.x,114);

//    MAMapStatus *status = [_theMapView getMapStatus];
//    status.screenAnchor = CGPointMake(0.5, 0.76);//地图左上为(0,0)点，右下为(1,1)点。
//    [_theMapView setMapStatus:status animated:NO];
 [self.view addSubview:_theMapView];
    
}

-(MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation{
    if ([annotation isKindOfClass:[MAPointAnnotation class]]){
        static NSString *reuseIndetifier = @"annotationReuseIndetifier";
        MAAnnotationView *annotationView = (MAAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
        if (annotationView == nil){
            annotationView = [[MAAnnotationView alloc] initWithAnnotation:annotation
                                                          reuseIdentifier:reuseIndetifier];
        }
        annotationView.image = [UIImage imageNamed:@"早餐店 copy 4"];
        //设置中心点偏移，使得标注底部中间点成为经纬度对应点
        annotationView.centerOffset = CGPointMake(38.122647, 116.209161);
        return annotationView;
    }
    return nil;
}




@end
