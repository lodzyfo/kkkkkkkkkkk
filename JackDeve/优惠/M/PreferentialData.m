//
//  PreferentialData.m
//  JackDeve
//
//  Created by 王奎卿 on 2017/5/9.
//  Copyright © 2017年 wkq. All rights reserved.
//

#import "PreferentialData.h"
#import <AFNetworking.h>
#import "PreferentialModel.h"

PreferentialData *data = nil;
@implementation PreferentialData

+ (instancetype)shareData
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        data = [[PreferentialData alloc]init];
    });
    return data;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    if (!data) {
        data = [super allocWithZone:zone];
    }
    return data;
}

- (instancetype)copy
{
    return self;
}

- (instancetype)mutableCopy
{
    return self;
}

- (void)getPreferentialData:(NSString *)url
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    //  设置解析器
    manager.requestSerializer = [[AFJSONRequestSerializer alloc]init];
    
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = (NSDictionary *)responseObject;
        
        NSMutableArray *arrayData = [NSMutableArray arrayWithArray:[dic objectForKey:@"data"]];
        
        NSMutableArray *arrayModel = [NSMutableArray array];
        
        for (NSDictionary *dd in arrayData) {
            PreferentialModel *model = [[PreferentialModel alloc]init];
            
            model.diner_id = [dd objectForKey:@"diner_id"];
            model.goods_id = [dd objectForKey:@"goods_id"];
            model.goods_name = [dd objectForKey:@"goods_name"];
            model.diner_name = [dd objectForKey:@"diner_name"];
            model.goods_pic = [dd objectForKey:@"goods_pic"];
            model.goods_price = [dd objectForKey:@"goods_price"];
            
            [arrayModel addObject:model];
        }
        
        [self.delegate jsonData:arrayModel];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
PreferentialData *preferentialData(id name)
{
    PreferentialData *data = [[PreferentialData alloc]init];
    
    return data;
}
