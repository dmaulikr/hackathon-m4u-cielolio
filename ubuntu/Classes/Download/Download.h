//
//  Donwload.h
//  ubuntu
//
//  Created by Denis Nascimento on 9/24/16.
//  Copyright © 2016 THS Solution Ltda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceReturnQueue.h"
#import "ServiceQueue.h"


typedef void(^completion)(BOOL success, id result);

@interface Download : NSObject

+(void)saveUser:(NSDictionary*)user;
+(NSDictionary*)user;

+(void)logout:(completion)completion;
//+(void)insertQueue:(ServiceQueue*)queue completion:(completion)completion;
+(void)insertQueueWithUrl:(NSString*)url queue:(ServiceQueue*)queue completion:(completion)completion;
+(void)queue:(ServiceQueue*)queue completion:(completion)completion;
+(void)professionals:(completion)completion;
+(void)products:(completion)completion;
+(void)calendar:(completion)completion;
+(void)merchants:(completion)completion;
//+(void)calendarWith:(NSString*)url completion:(completion)completion;
+(void)calendarWith:(NSString*)url product:(NSString*)product completion:(completion)completion ;
@end
