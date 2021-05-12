//
//	Data.m
//
//	Create by apple on 9/5/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Data.h"

NSString *const kDataAvatar = @"avatar";
NSString *const kDataIsLocked = @"is_locked";
NSString *const kDataMobile = @"mobile";
NSString *const kDataToken = @"token";
NSString *const kDataUserName = @"user_name";

@interface Data ()
@end
@implementation Data




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDataAvatar] isKindOfClass:[NSNull class]]){
		self.avatar = dictionary[kDataAvatar];
	}	
	if(![dictionary[kDataIsLocked] isKindOfClass:[NSNull class]]){
		self.is_locked = dictionary[kDataIsLocked];
	}	
	if(![dictionary[kDataMobile] isKindOfClass:[NSNull class]]){
		self.mobile = dictionary[kDataMobile];
	}	
	if(![dictionary[kDataToken] isKindOfClass:[NSNull class]]){
		self.token = dictionary[kDataToken];
	}	
	if(![dictionary[kDataUserName] isKindOfClass:[NSNull class]]){
		self.user_name = dictionary[kDataUserName];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.avatar != nil){
		dictionary[kDataAvatar] = self.avatar;
	}
	if(self.is_locked != nil){
		dictionary[kDataIsLocked] = self.is_locked;
	}
	if(self.mobile != nil){
		dictionary[kDataMobile] = self.mobile;
	}
	if(self.token != nil){
		dictionary[kDataToken] = self.token;
	}
	if(self.user_name != nil){
		dictionary[kDataUserName] = self.user_name;
	}
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
	if(self.avatar != nil){
		[aCoder encodeObject:self.avatar forKey:kDataAvatar];
	}
	if(self.is_locked != nil){
		[aCoder encodeObject:self.is_locked forKey:kDataIsLocked];
	}
	if(self.mobile != nil){
		[aCoder encodeObject:self.mobile forKey:kDataMobile];
	}
	if(self.token != nil){
		[aCoder encodeObject:self.token forKey:kDataToken];
	}
	if(self.user_name != nil){
		[aCoder encodeObject:self.user_name forKey:kDataUserName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.avatar = [aDecoder decodeObjectForKey:kDataAvatar];
	self.is_locked = [aDecoder decodeObjectForKey:kDataIsLocked];
	self.mobile = [aDecoder decodeObjectForKey:kDataMobile];
	self.token = [aDecoder decodeObjectForKey:kDataToken];
	self.user_name = [aDecoder decodeObjectForKey:kDataUserName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Data *copy = [Data new];

	copy.avatar = [self.avatar copy];
	copy.is_locked = [self.is_locked copy];
	copy.mobile = [self.mobile copy];
	copy.token = [self.token copy];
	copy.user_name = [self.user_name copy];

	return copy;
}
@end
