//
//  Product.m
//
//  Created by Denis Nascimento on 9/25/16
//  Copyright (c) 2016 Ths Solution. All rights reserved.
//

#import "Product.h"


NSString *const kProductId = @"id";
NSString *const kProductUrl = @"url";
NSString *const kProductName = @"name";
NSString *const kProductPrice = @"price";


@interface Product ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Product

@synthesize productIdentifier = _productIdentifier;
@synthesize url = _url;
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
            self.productIdentifier = [self objectOrNilForKey:kProductId fromDictionary:dict];
            self.url = [self objectOrNilForKey:kProductUrl fromDictionary:dict];
            self.name = [self objectOrNilForKey:kProductName fromDictionary:dict];
            self.price = [self objectOrNilForKey:kProductPrice fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.productIdentifier forKey:kProductId];
    [mutableDict setValue:self.url forKey:kProductUrl];
    [mutableDict setValue:self.name forKey:kProductName];
    [mutableDict setValue:self.price forKey:kProductPrice];

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

    self.productIdentifier = [aDecoder decodeObjectForKey:kProductId];
    self.url = [aDecoder decodeObjectForKey:kProductUrl];
    self.name = [aDecoder decodeObjectForKey:kProductName];
    self.price = [aDecoder decodeObjectForKey:kProductPrice];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_productIdentifier forKey:kProductId];
    [aCoder encodeObject:_url forKey:kProductUrl];
    [aCoder encodeObject:_name forKey:kProductName];
    [aCoder encodeObject:_price forKey:kProductPrice];
}

- (id)copyWithZone:(NSZone *)zone
{
    Product *copy = [[Product alloc] init];
    
    if (copy) {

        copy.productIdentifier = [self.productIdentifier copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.price = [self.price copyWithZone:zone];
    }
    
    return copy;
}


@end
