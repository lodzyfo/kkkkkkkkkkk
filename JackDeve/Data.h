//
//	Data.h
//
//	Create by apple on 9/5/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface Data : NSObject

@property (nonatomic, strong) NSString * avatar;
@property (nonatomic, strong) NSString * is_locked;
@property (nonatomic, strong) NSString * mobile;
@property (nonatomic, strong) NSString * token;
@property (nonatomic, strong) NSString * user_name;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
