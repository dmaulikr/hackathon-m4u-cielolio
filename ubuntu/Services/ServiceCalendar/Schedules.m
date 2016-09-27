//
//  Schedules.m
//
//  Created by Denis Nascimento on 9/25/16
//  Copyright (c) 2016 Ths Solution. All rights reserved.
//

#import "Schedules.h"


NSString *const kSchedulesCustomerName = @"customer_name";
NSString *const kSchedulesId = @"id";
NSString *const kSchedulesCustomerContact = @"customer_contact";
NSString *const kSchedulesCustomerSocialId = @"customer_social_id";
NSString *const kSchedulesCustomerPhoto = @"customer_photo";
NSString *const kSchedulesStatus = @"status";


@interface Schedules ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Schedules

@synthesize customerName = _customerName;
@synthesize schedulesIdentifier = _schedulesIdentifier;
@synthesize customerContact = _customerContact;
@synthesize customerSocialId = _customerSocialId;
@synthesize customerPhoto = _customerPhoto;
@synthesize status = _status;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.customerName = [self objectOrNilForKey:kSchedulesCustomerName fromDictionary:dict];
            self.schedulesIdentifier = [self objectOrNilForKey:kSchedulesId fromDictionary:dict];
            self.customerContact = [self objectOrNilForKey:kSchedulesCustomerContact fromDictionary:dict];
            self.customerSocialId = [self objectOrNilForKey:kSchedulesCustomerSocialId fromDictionary:dict];
            self.customerPhoto = [self objectOrNilForKey:kSchedulesCustomerPhoto fromDictionary:dict];
            self.status = [self objectOrNilForKey:kSchedulesStatus fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.customerName forKey:kSchedulesCustomerName];
    [mutableDict setValue:self.schedulesIdentifier forKey:kSchedulesId];
    [mutableDict setValue:self.customerContact forKey:kSchedulesCustomerContact];
    [mutableDict setValue:self.customerSocialId forKey:kSchedulesCustomerSocialId];
    [mutableDict setValue:self.customerPhoto forKey:kSchedulesCustomerPhoto];
    [mutableDict setValue:self.status forKey:kSchedulesStatus];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.customerName = [aDecoder decodeObjectForKey:kSchedulesCustomerName];
    self.schedulesIdentifier = [aDecoder decodeObjectForKey:kSchedulesId];
    self.customerContact = [aDecoder decodeObjectForKey:kSchedulesCustomerContact];
    self.customerSocialId = [aDecoder decodeObjectForKey:kSchedulesCustomerSocialId];
    self.customerPhoto = [aDecoder decodeObjectForKey:kSchedulesCustomerPhoto];
    self.status = [aDecoder decodeObjectForKey:kSchedulesStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_customerName forKey:kSchedulesCustomerName];
    [aCoder encodeObject:_schedulesIdentifier forKey:kSchedulesId];
    [aCoder encodeObject:_customerContact forKey:kSchedulesCustomerContact];
    [aCoder encodeObject:_customerSocialId forKey:kSchedulesCustomerSocialId];
    [aCoder encodeObject:_customerPhoto forKey:kSchedulesCustomerPhoto];
    [aCoder encodeObject:_status forKey:kSchedulesStatus];
}

- (id)copyWithZone:(NSZone *)zone
{
    Schedules *copy = [[Schedules alloc] init];
    
    if (copy) {

        copy.customerName = [self.customerName copyWithZone:zone];
        copy.schedulesIdentifier = [self.schedulesIdentifier copyWithZone:zone];
        copy.customerContact = [self.customerContact copyWithZone:zone];
        copy.customerSocialId = [self.customerSocialId copyWithZone:zone];
        copy.customerPhoto = [self.customerPhoto copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
    }
    
    return copy;
}


@end
