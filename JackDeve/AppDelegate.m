//
//  AppDelegate.m
//  JackDeve

//  Created by 王奎卿 on 2017/5/8.
//  Copyright © 2017年 wkq. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (nonatomic) IIViewDeckController *viewDeckController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
     
    //跳转
    ScrollViewController * VC =[[ScrollViewController alloc]init];
    UINavigationController * NVC =[[UINavigationController alloc]initWithRootViewController:VC];
    
    LeftViewController *leftVC = [[LeftViewController alloc] init];
//     UINavigationController * NVC1 =[[UINavigationController alloc]initWithRootViewController:leftVC];
    
    
    leftVC.pushBlock = ^(NSInteger index) {
        VC.index = index;
    };
    
    leftVC.imgBlock = ^(BOOL push) {
        VC.push = push;
    };
    IIViewDeckController *vc = [[IIViewDeckController alloc] initWithCenterViewController:NVC leftViewController:leftVC];
    //设置左边视图显示时的宽度
    self.viewDeckController = vc;
    self.window.rootViewController =vc;
    
    //地图api
    [[AMapServices sharedServices]setApiKey:@"1ba9abc6231fb3f8dc6dac20a8721955"];
    [[AMapServices sharedServices]setEnableHTTPS:YES];//HTTPS
    [AMapServices sharedServices].crashReportEnabled = YES;//上传崩溃日志

    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
