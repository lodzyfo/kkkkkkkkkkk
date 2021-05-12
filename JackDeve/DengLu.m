//
//	DengLu.m
//
//	Create by apple on 9/5/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DengLu.h"

NSString *const kDengLuData = @"data";
NSString *const kDengLuErrcode = @"errcode";

@interface DengLu ()
@end
@implementation DengLu




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDengLuData] isKindOfClass:[NSNull class]]){
		self.data = [[Data alloc] initWithDictionary:dictionary[kDengLuData]];
	}

	if(![dictionary[kDengLuErrcode] isKindOfClass:[NSNull class]]){
		self.errcode = [dictionary[kDengLuErrcode] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.data != nil){
		dictionary[kDengLuData] = [self.data toDictionary];
	}
	dictionary[kDengLuErrcode] = @(self.errcode);
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kDengLuData];
	}
	[aCoder encodeObject:@(self.errcode) forKey:kDengLuErrcode];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.data = [aDecoder decodeObjectForKey:kDengLuData];
	self.errcode = [[aDecoder decodeObjectForKey:kDengLuErrcode] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DengLu *copy = [DengLu new];

	copy.data = [self.data copy];
	copy.errcode = self.errcode;

	return copy;
}
@end