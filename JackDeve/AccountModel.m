//
//  AccountModel.m
//  JackDeve
//
//  Created by apple on 17/5/10.
//  Copyright © 2017年 wkq. All rights reserved.
//

#import "AccountModel.h"
static AccountModel * m=nil;
@implementation AccountModel
{
    NSDictionary * dic;
    NSDictionary * dic2;
}

+(instancetype)showData{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        m =[[AccountModel alloc]init];
    });
    return m;
    
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    
    if (m==nil) {
        m =[super allocWithZone:zone];
    }
    return m;
    
    
}
-(id)copy{
    return self;
}

-(id)mutableCopy{
    return self;
    
}
-(void)getDataAndBlock:(callBackBlock)block{
    
    Data * m =[HomeUserDefault getUserDefault];
    
    NSURL * url =[NSURL URLWithString:[NSString stringWithFormat:Out,m.token]];
    
    NSURLSession * session =[NSURLSession sharedSession];
    
    //数据任务
    NSURLSessionTask * task =[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        dic =[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        if (block && dic) {
            block(dic);
        }
        
    }];
    
    [task resume];
    
    
    
}

@end
