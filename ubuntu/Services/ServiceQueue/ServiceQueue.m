//
//  ServiceQueue.m
//
//  Created by Denis Nascimento on 9/24/16
//  Copyright (c) 2016 Ths Solution. All rights reserved.
//

#import "ServiceQueue.h"


NSString *const kServiceQueueQuantity = @"quantity";
NSString *const kServiceQueuePhone = @"phone";
NSString *const kServiceQueueName = @"name";
NSString *const kServiceQueuePhoto = @"photo";
NSString *const kServiceQueueLocation = @"location";
NSString *const kServiceQueueurl = @"url";


@interface ServiceQueue ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ServiceQueue

@synthesize quantity = _quantity;
@synthesize phone = _phone;
@synthesize name = _name;
@synthesize photo = _photo;
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
            self.quantity = [self objectOrNilForKey:kServiceQueueQuantity fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kServiceQueuePhone fromDictionary:dict];
            self.name = [self objectOrNilForKey:kServiceQueueName fromDictionary:dict];
            self.photo = [self objectOrNilForKey:kServiceQueuePhoto fromDictionary:dict];
            self.location = [self objectOrNilForKey:kServiceQueueLocation fromDictionary:dict];
                    self.url = [self objectOrNilForKey:kServiceQueueurl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.quantity forKey:kServiceQueueQuantity];
    [mutableDict setValue:self.phone forKey:kServiceQueuePhone];
    [mutableDict setValue:self.name forKey:kServiceQueueName];
    [mutableDict setValue:self.photo forKey:kServiceQueuePhoto];
    [mutableDict setValue:self.location forKey:kServiceQueueLocation];
    [mutableDict setValue:self.url forKey:kServiceQueueurl];

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

    self.quantity = [aDecoder decodeObjectForKey:kServiceQueueQuantity];
    self.phone = [aDecoder decodeObjectForKey:kServiceQueuePhone];
    self.name = [aDecoder decodeObjectForKey:kServiceQueueName];
    self.photo = [aDecoder decodeObjectForKey:kServiceQueuePhoto];
    self.location = [aDecoder decodeObjectForKey:kServiceQueueLocation];
    self.url = [aDecoder decodeObjectForKey:kServiceQueueurl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_quantity forKey:kServiceQueueQuantity];
    [aCoder encodeObject:_phone forKey:kServiceQueuePhone];
    [aCoder encodeObject:_name forKey:kServiceQueueName];
    [aCoder encodeObject:_photo forKey:kServiceQueuePhoto];
    [aCoder encodeObject:_location forKey:kServiceQueueLocation];
    [aCoder encodeObject:_url forKey:kServiceQueueurl];
}

- (id)copyWithZone:(NSZone *)zone
{
    ServiceQueue *copy = [[ServiceQueue alloc] init];
    
    if (copy) {

        copy.quantity = [self.quantity copyWithZone:zone];
        copy.phone = [self.phone copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.photo = [self.photo copyWithZone:zone];
        copy.location = [self.location copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end
