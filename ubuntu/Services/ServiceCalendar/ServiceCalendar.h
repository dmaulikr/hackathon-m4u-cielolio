//
//  ServiceCalendar.h
//
//  Created by Denis Nascimento on 9/25/16
//  Copyright (c) 2016 Ths Solution. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Product, Professional;

@interface ServiceCalendar : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) Product *product;
@property (nonatomic, strong) NSString *internalBaseClassIdentifier;
@property (nonatomic, strong) Professional *professional;
@property (nonatomic, strong) NSString *datetime;
@property (nonatomic, assign) BOOL isAvailable;
@property (nonatomic, strong) NSArray *schedules;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *photo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
