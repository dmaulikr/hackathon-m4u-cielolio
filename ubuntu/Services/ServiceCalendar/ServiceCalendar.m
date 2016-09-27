//
//  ServiceCalendar.m
//
//  Created by Denis Nascimento on 9/25/16
//  Copyright (c) 2016 Ths Solution. All rights reserved.
//

#import "ServiceCalendar.h"
#import "Product.h"
#import "Professional.h"


NSString *const kServiceCalendarProduct = @"product";
NSString *const kServiceCalendarId = @"id";
NSString *const kServiceCalendarProfessional = @"professional";
NSString *const kServiceCalendarDatetime = @"datetime";
NSString *const kServiceCalendarIsAvailable = @"is_available";
NSString *const kServiceCalendarSchedules = @"schedules";
NSString *const kServiceCalendarUrl = @"url";
NSString *const kServiceCalendarPhoto = @"photo";


@interface ServiceCalendar ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ServiceCalendar

@synthesize product = _product;
@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize professional = _professional;
@synthesize datetime = _datetime;
@synthesize isAvailable = _isAvailable;
@synthesize schedules = _schedules;
@synthesize url = _url;
@synthesize photo =_photo;


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
            self.product = [Product modelObjectWithDictionary:[dict objectForKey:kServiceCalendarProduct]];
            self.internalBaseClassIdentifier = [self objectOrNilForKey:kServiceCalendarId fromDictionary:dict];
            self.professional = [Professional modelObjectWithDictionary:[dict objectForKey:kServiceCalendarProfessional]];
            self.datetime = [self objectOrNilForKey:kServiceCalendarDatetime fromDictionary:dict];
            self.isAvailable = [[self objectOrNilForKey:kServiceCalendarIsAvailable fromDictionary:dict] boolValue];
            self.schedules = [self objectOrNilForKey:kServiceCalendarSchedules fromDictionary:dict];
            self.url = [self objectOrNilForKey:kServiceCalendarUrl fromDictionary:dict];
        self.photo = [self objectOrNilForKey:kServiceCalendarPhoto fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.product dictionaryRepresentation] forKey:kServiceCalendarProduct];
    [mutableDict setValue:self.internalBaseClassIdentifier forKey:kServiceCalendarId];
    [mutableDict setValue:[self.professional dictionaryRepresentation] forKey:kServiceCalendarProfessional];
    [mutableDict setValue:self.datetime forKey:kServiceCalendarDatetime];
    [mutableDict setValue:[NSNumber numberWithBool:self.isAvailable] forKey:kServiceCalendarIsAvailable];
    NSMutableArray *tempArrayForSchedules = [NSMutableArray array];
    for (NSObject *subArrayObject in self.schedules) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSchedules addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSchedules addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSchedules] forKey:kServiceCalendarSchedules];
    [mutableDict setValue:self.url forKey:kServiceCalendarUrl];
    [mutableDict setValue:self.photo forKey:kServiceCalendarPhoto];

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

    self.product = [aDecoder decodeObjectForKey:kServiceCalendarProduct];
    self.internalBaseClassIdentifier = [aDecoder decodeObjectForKey:kServiceCalendarId];
    self.professional = [aDecoder decodeObjectForKey:kServiceCalendarProfessional];
    self.datetime = [aDecoder decodeObjectForKey:kServiceCalendarDatetime];
    self.isAvailable = [aDecoder decodeBoolForKey:kServiceCalendarIsAvailable];
    self.schedules = [aDecoder decodeObjectForKey:kServiceCalendarSchedules];
    self.url = [aDecoder decodeObjectForKey:kServiceCalendarUrl];
    self.photo = [aDecoder decodeObjectForKey:kServiceCalendarPhoto];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_product forKey:kServiceCalendarProduct];
    [aCoder encodeObject:_internalBaseClassIdentifier forKey:kServiceCalendarId];
    [aCoder encodeObject:_professional forKey:kServiceCalendarProfessional];
    [aCoder encodeObject:_datetime forKey:kServiceCalendarDatetime];
    [aCoder encodeBool:_isAvailable forKey:kServiceCalendarIsAvailable];
    [aCoder encodeObject:_schedules forKey:kServiceCalendarSchedules];
    [aCoder encodeObject:_url forKey:kServiceCalendarUrl];
    [aCoder encodeObject:_photo forKey:kServiceCalendarPhoto];
}

- (id)copyWithZone:(NSZone *)zone
{
    ServiceCalendar *copy = [[ServiceCalendar alloc] init];
    
    if (copy) {

        copy.product = [self.product copyWithZone:zone];
        copy.internalBaseClassIdentifier = [self.internalBaseClassIdentifier copyWithZone:zone];
        copy.professional = [self.professional copyWithZone:zone];
        copy.datetime = [self.datetime copyWithZone:zone];
        copy.isAvailable = self.isAvailable;
        copy.schedules = [self.schedules copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.photo = [self.photo copyWithZone:zone];
    }
    
    return copy;
}


@end
