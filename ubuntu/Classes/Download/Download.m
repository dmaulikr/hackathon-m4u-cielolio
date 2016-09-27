//
//  Donwload.m
//  ubuntu
//
//  Created by Denis Nascimento on 9/24/16.
//  Copyright © 2016 THS Solution Ltda. All rights reserved.
//

#import "Download.h"
#import "AFURLSessionManager.h"
#import "ServiceQueue.h"
#import "ServiceReturnQueue.h"
#import "ServiceProducts.h"
#import "ServiceProfessionals.h"
#import "ServiceCalendar.h"
#import "ServiceMerchants.h"

#define RB_USER_KEY @"khjkdgse7667t"

@implementation Download


+(void)saveUser:(NSDictionary*)user{
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:user];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:RB_USER_KEY];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

+(NSDictionary*)user{
    
    NSData *dictionaryData = [[NSUserDefaults standardUserDefaults] objectForKey:RB_USER_KEY];
    NSDictionary *dictionary = [NSKeyedUnarchiver unarchiveObjectWithData:dictionaryData];
    return dictionary;//  [ServiceUser modelObjectWithDictionary:dictionary];
    
}


+(void)logout:(completion)completion {
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:RB_USER_KEY];
    [[NSUserDefaults standardUserDefaults]synchronize];
    completion(YES,nil);
    
}

+(void)insertQueueWithUrl:(NSString*)url queue:(ServiceQueue*)queue completion:(completion)completion{
    
     NSString *urlNew = [NSString stringWithFormat:@"%@schedules/",url];
    
    NSDictionary *parameters = @{ @"calendar_space":queue.url
                                  ,@"customer_name":queue.name
                                  ,@"customer_contact":queue.phone
                                  ,@"customer_social":queue.photo
                                  };
    
    [self post:urlNew params:parameters completion:^(BOOL success, id result) {
        
        if (success) {
            ServiceReturnQueue *service = [ServiceReturnQueue modelObjectWithDictionary:(NSDictionary*)result];
            if (service){
                completion(YES,service);
            }else{
                completion(NO,nil);
            }
        }else{
            completion(NO,nil);
        }
    }];
    
}


+(void)products:(completion)completion {
    
    NSString *url = @"http://888f150d.ngrok.io/api/v1/merchants/1/products/";
    
    
    NSMutableArray *tmp = [NSMutableArray array];
    
    [self get:url completion:^(BOOL success, id result) {
        
        if (success) {
            
            for (NSDictionary *item in (NSArray*)result) {
                ServiceProducts *service = [ServiceProducts modelObjectWithDictionary:(NSDictionary*)item];
                [tmp addObject:service];
            }
            completion(YES,tmp);
        }else{
            completion(NO,nil);
        }
    }];
}



+(void)merchants:(completion)completion {
    
    NSString *url = @"http://888f150d.ngrok.io/api/v1/merchants";
    
    
    NSMutableArray *tmp = [NSMutableArray array];
    
    [self get:url completion:^(BOOL success, id result) {
        
        if (success) {
            
            for (NSDictionary *item in (NSArray*)result) {
                ServiceMerchants *service = [ServiceMerchants modelObjectWithDictionary:(NSDictionary*)item];
                [tmp addObject:service];
            }
            completion(YES,tmp);
        }else{
            completion(NO,nil);
        }
    }];
}

+(void)professionals:(completion)completion {
    
    NSString *url = @"http://888f150d.ngrok.io/api/v1/merchants/1/professionals/";
    
    NSMutableArray *tmp = [NSMutableArray array];
    
    [self get:url completion:^(BOOL success, id result) {
        
        if (success) {
            
            for (NSDictionary *item in (NSArray*)result) {
                ServiceProfessionals *service = [ServiceProfessionals modelObjectWithDictionary:(NSDictionary*)item];
                [tmp addObject:service];
            }
            completion(YES,tmp);
        }else{
            completion(NO,nil);
        }
    }];
}

+(void)calendar:(completion)completion {
    
    NSString *url = @"http://888f150d.ngrok.io/api/v1/merchants/2/calendar";
    
    NSMutableArray *tmp = [NSMutableArray array];
    
    [self get:url completion:^(BOOL success, id result) {
        
        if (success) {
            
            for (NSDictionary *item in (NSArray*)result) {
                ServiceCalendar *service = [ServiceCalendar modelObjectWithDictionary:(NSDictionary*)item];
                [tmp addObject:service];
            }
            completion(YES,tmp);
        }else{
            completion(NO,nil);
        }
    }];
}

+(void)calendarWith:(NSString*)url product:(NSString*)product completion:(completion)completion {
    
    NSString *urlNew = [NSString stringWithFormat:@"%@calendar_available?product=%@",url,product];
    
    NSMutableArray *tmp = [NSMutableArray array];
    
    [self get:urlNew completion:^(BOOL success, id result) {
        
        if (success) {
            
            for (NSDictionary *item in (NSArray*)result) {
                ServiceCalendar *service = [ServiceCalendar modelObjectWithDictionary:(NSDictionary*)item];
                [tmp addObject:service];
            }
            completion(YES,tmp);
        }else{
            completion(NO,nil);
        }
    }];
}



+(void)queue:(ServiceQueue*)queue completion:(completion)completion{
    
}


+(void)get:(NSString*)url completion:(completion)completion {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:url parameters:nil error:nil];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            completion(NO,responseObject);
        } else {
            completion(YES,responseObject);
        }
    }];
    
    [dataTask resume];
    
}


+(void)post:(NSString*)url  params:(NSDictionary*)params completion:(completion)completion {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
     configuration.HTTPAdditionalHeaders = @{@"Content-Type":@"application/json"};
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:url parameters:params error:nil];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        completion(YES,responseObject);
        
    }];
    
    [dataTask resume];
    
}


@end
