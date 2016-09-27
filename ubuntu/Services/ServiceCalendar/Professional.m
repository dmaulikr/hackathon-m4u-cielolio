//
//  Professional.m
//
//  Created by Denis Nascimento on 9/25/16
//  Copyright (c) 2016 Ths Solution. All rights reserved.
//

#import "Professional.h"


NSString *const kProfessionalId = @"id";
NSString *const kProfessionalUrl = @"url";
NSString *const kProfessionalName = @"name";
NSString *const kProfessionalPhoto = @"photo";


@interface Professional ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Professional

@synthesize professionalIdentifier = _professionalIdentifier;
@synthesize url = _url;
@synthesize name = _name;
@synthesize photo = _photo;


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
            self.professionalIdentifier = [self objectOrNilForKey:kProfessionalId fromDictionary:dict];
            self.url = [self objectOrNilForKey:kProfessionalUrl fromDictionary:dict];
            self.name = [self objectOrNilForKey:kProfessionalName fromDictionary:dict];
            self.photo = [self objectOrNilForKey:kProfessionalPhoto fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.professionalIdentifier forKey:kProfessionalId];
    [mutableDict setValue:self.url forKey:kProfessionalUrl];
    [mutableDict setValue:self.name forKey:kProfessionalName];
    [mutableDict setValue:self.photo forKey:kProfessionalPhoto];

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

    self.professionalIdentifier = [aDecoder decodeObjectForKey:kProfessionalId];
    self.url = [aDecoder decodeObjectForKey:kProfessionalUrl];
    self.name = [aDecoder decodeObjectForKey:kProfessionalName];
    self.photo = [aDecoder decodeObjectForKey:kProfessionalPhoto];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_professionalIdentifier forKey:kProfessionalId];
    [aCoder encodeObject:_url forKey:kProfessionalUrl];
    [aCoder encodeObject:_name forKey:kProfessionalName];
    [aCoder encodeObject:_photo forKey:kProfessionalPhoto];
}

- (id)copyWithZone:(NSZone *)zone
{
    Professional *copy = [[Professional alloc] init];
    
    if (copy) {

        copy.professionalIdentifier = [self.professionalIdentifier copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.photo = [self.photo copyWithZone:zone];
    }
    
    return copy;
}


@end
