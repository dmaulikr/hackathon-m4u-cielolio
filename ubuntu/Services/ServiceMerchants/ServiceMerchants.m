//
//  ServiceMerchants.m
//
//  Created by Denis Nascimento on 9/25/16
//  Copyright (c) 2016 Ths Solution. All rights reserved.
//

#import "ServiceMerchants.h"


NSString *const kServiceMerchantsName = @"name";
NSString *const kServiceMerchantsId = @"id";
NSString *const kServiceMerchantsCieloId = @"cielo_id";
NSString *const kServiceMerchantsLocation = @"location";
NSString *const kServiceMerchantsUrl = @"url";


@interface ServiceMerchants ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ServiceMerchants

@synthesize name = _name;
@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize cieloId = _cieloId;
@synthesize location = _location;
@synthesize url = _url;


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
            self.name = [self objectOrNilForKey:kServiceMerchantsName fromDictionary:dict];
            self.internalBaseClassIdentifier = [self objectOrNilForKey:kServiceMerchantsId fromDictionary:dict];
            self.cieloId = [self objectOrNilForKey:kServiceMerchantsCieloId fromDictionary:dict];
            self.location = [self objectOrNilForKey:kServiceMerchantsLocation fromDictionary:dict];
            self.url = [self objectOrNilForKey:kServiceMerchantsUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kServiceMerchantsName];
    [mutableDict setValue:self.internalBaseClassIdentifier forKey:kServiceMerchantsId];
    [mutableDict setValue:self.cieloId forKey:kServiceMerchantsCieloId];
    [mutableDict setValue:self.location forKey:kServiceMerchantsLocation];
    [mutableDict setValue:self.url forKey:kServiceMerchantsUrl];

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

    self.name = [aDecoder decodeObjectForKey:kServiceMerchantsName];
    self.internalBaseClassIdentifier = [aDecoder decodeObjectForKey:kServiceMerchantsId];
    self.cieloId = [aDecoder decodeObjectForKey:kServiceMerchantsCieloId];
    self.location = [aDecoder decodeObjectForKey:kServiceMerchantsLocation];
    self.url = [aDecoder decodeObjectForKey:kServiceMerchantsUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kServiceMerchantsName];
    [aCoder encodeObject:_internalBaseClassIdentifier forKey:kServiceMerchantsId];
    [aCoder encodeObject:_cieloId forKey:kServiceMerchantsCieloId];
    [aCoder encodeObject:_location forKey:kServiceMerchantsLocation];
    [aCoder encodeObject:_url forKey:kServiceMerchantsUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    ServiceMerchants *copy = [[ServiceMerchants alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.internalBaseClassIdentifier = [self.internalBaseClassIdentifier copyWithZone:zone];
        copy.cieloId = [self.cieloId copyWithZone:zone];
        copy.location = [self.location copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end
