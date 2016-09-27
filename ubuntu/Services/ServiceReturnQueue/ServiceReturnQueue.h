//
//  ServiceReturnQueue.h
//
//  Created by Denis Nascimento on 9/24/16
//  Copyright (c) 2016 Ths Solution. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ServiceReturnQueue : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *quantity;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *internalBaseClassIdentifier;
@property (nonatomic, strong) NSString *order;
@property (nonatomic, assign) id location;
@property (nonatomic, strong) NSString *photo;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
