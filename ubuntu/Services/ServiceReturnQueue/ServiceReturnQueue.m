//
//  ServiceReturnQueue.m
//
//  Created by Denis Nascimento on 9/24/16
//  Copyright (c) 2016 Ths Solution. All rights reserved.
//

#import "ServiceReturnQueue.h"


NSString *const kServiceReturnQueuePhone = @"phone";
NSString *const kServiceReturnQueueQuantity = @"quantity";
NSString *const kServiceReturnQueueStatus = @"status";
NSString *const kServiceReturnQueueId = @"id";
NSString *const kServiceReturnQueueOrder = @"order";
NSString *const kServiceReturnQueueLocation = @"location";
NSString *const kServiceReturnQueuePhoto = @"photo";
NSString *const kServiceReturnQueueName = @"name";


@interface ServiceReturnQueue ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ServiceReturnQueue

@synthesize phone = _phone;
@synthesize quantity = _quantity;
@synthesize status = _status;
@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize order = _order;
@synthesize location = _location;
@synthesize photo = _photo;
@synthesize name = _name;


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
            self.phone = [self objectOrNilForKey:kServiceReturnQueuePhone fromDictionary:dict];
            self.quantity = [self objectOrNilForKey:kServiceReturnQueueQuantity fromDictionary:dict];
            self.status = [self objectOrNilForKey:kServiceReturnQueueStatus fromDictionary:dict];
            self.internalBaseClassIdentifier = [self objectOrNilForKey:kServiceReturnQueueId fromDictionary:dict];
            self.order = [self objectOrNilForKey:kServiceReturnQueueOrder fromDictionary:dict];
            self.location = [self objectOrNilForKey:kServiceReturnQueueLocation fromDictionary:dict];
            self.photo = [self objectOrNilForKey:kServiceReturnQueuePhoto fromDictionary:dict];
            self.name = [self objectOrNilForKey:kServiceReturnQueueName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.phone forKey:kServiceReturnQueuePhone];
    [mutableDict setValue:self.quantity forKey:kServiceReturnQueueQuantity];
    [mutableDict setValue:self.status forKey:kServiceReturnQueueStatus];
    [mutableDict setValue:self.internalBaseClassIdentifier forKey:kServiceReturnQueueId];
    [mutableDict setValue:self.order forKey:kServiceReturnQueueOrder];
    [mutableDict setValue:self.location forKey:kServiceReturnQueueLocation];
    [mutableDict setValue:self.photo forKey:kServiceReturnQueuePhoto];
    [mutableDict setValue:self.name forKey:kServiceReturnQueueName];

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

    self.phone = [aDecoder decodeObjectForKey:kServiceReturnQueuePhone];
    self.quantity = [aDecoder decodeObjectForKey:kServiceReturnQueueQuantity];
    self.status = [aDecoder decodeObjectForKey:kServiceReturnQueueStatus];
    self.internalBaseClassIdentifier = [aDecoder decodeObjectForKey:kServiceReturnQueueId];
    self.order = [aDecoder decodeObjectForKey:kServiceReturnQueueOrder];
    self.location = [aDecoder decodeObjectForKey:kServiceReturnQueueLocation];
    self.photo = [aDecoder decodeObjectForKey:kServiceReturnQueuePhoto];
    self.name = [aDecoder decodeObjectForKey:kServiceReturnQueueName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_phone forKey:kServiceReturnQueuePhone];
    [aCoder encodeObject:_quantity forKey:kServiceReturnQueueQuantity];
    [aCoder encodeObject:_status forKey:kServiceReturnQueueStatus];
    [aCoder encodeObject:_internalBaseClassIdentifier forKey:kServiceReturnQueueId];
    [aCoder encodeObject:_order forKey:kServiceReturnQueueOrder];
    [aCoder encodeObject:_location forKey:kServiceReturnQueueLocation];
    [aCoder encodeObject:_photo forKey:kServiceReturnQueuePhoto];
    [aCoder encodeObject:_name forKey:kServiceReturnQueueName];
}

- (id)copyWithZone:(NSZone *)zone
{
    ServiceReturnQueue *copy = [[ServiceReturnQueue alloc] init];
    
    if (copy) {

        copy.phone = [self.phone copyWithZone:zone];
        copy.quantity = [self.quantity copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.internalBaseClassIdentifier = [self.internalBaseClassIdentifier copyWithZone:zone];
        copy.order = [self.order copyWithZone:zone];
//        copy.location = [self.location copyWithZone:zone];
        copy.photo = [self.photo copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
