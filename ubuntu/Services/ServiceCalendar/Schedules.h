//
//  Schedules.h
//
//  Created by Denis Nascimento on 9/25/16
//  Copyright (c) 2016 Ths Solution. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Schedules : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *customerName;
@property (nonatomic, strong) NSString *schedulesIdentifier;
@property (nonatomic, strong) NSString *customerContact;
@property (nonatomic, assign) id customerSocialId;
@property (nonatomic, assign) id customerPhoto;
@property (nonatomic, strong) NSString *status;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
