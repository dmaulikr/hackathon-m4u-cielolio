//
//  ServiceProducts.m
//
//  Created by Denis Nascimento on 9/25/16
//  Copyright (c) 2016 Ths Solution. All rights reserved.
//

#import "ServiceProducts.h"


NSString *const kServiceProductsId = @"id";
NSString *const kServiceProductsName = @"name";
NSString *const kServiceProductsPrice = @"price";


@interface ServiceProducts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ServiceProducts

@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize name = _name;
@synthesize price = _price;


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
            self.internalBaseClassIdentifier = [self objectOrNilForKey:kServiceProductsId fromDictionary:dict];
            self.name = [self objectOrNilForKey:kServiceProductsName fromDictionary:dict];
            self.price = [self objectOrNilForKey:kServiceProductsPrice fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.internalBaseClassIdentifier forKey:kServiceProductsId];
    [mutableDict setValue:self.name forKey:kServiceProductsName];
    [mutableDict setValue:self.price forKey:kServiceProductsPrice];

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

    self.internalBaseClassIdentifier = [aDecoder decodeObjectForKey:kServiceProductsId];
    self.name = [aDecoder decodeObjectForKey:kServiceProductsName];
    self.price = [aDecoder decodeObjectForKey:kServiceProductsPrice];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_internalBaseClassIdentifier forKey:kServiceProductsId];
    [aCoder encodeObject:_name forKey:kServiceProductsName];
    [aCoder encodeObject:_price forKey:kServiceProductsPrice];
}

- (id)copyWithZone:(NSZone *)zone
{
    ServiceProducts *copy = [[ServiceProducts alloc] init];
    
    if (copy) {

        copy.internalBaseClassIdentifier = [self.internalBaseClassIdentifier copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.price = [self.price copyWithZone:zone];
    }
    
    return copy;
}


@end
