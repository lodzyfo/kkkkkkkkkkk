//
//	DengLu.h
//
//	Create by apple on 9/5/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "Data.h"

@interface DengLu : NSObject

@property (nonatomic, strong) Data * data;
@property (nonatomic, assign) NSInteger errcode;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end