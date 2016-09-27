//
//  ServiceProducts.h
//
//  Created by Denis Nascimento on 9/25/16
//  Copyright (c) 2016 Ths Solution. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ServiceProducts : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *internalBaseClassIdentifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *price;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
