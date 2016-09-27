//
//  AppDelegate.h
//  ubuntu
//
//  Created by Denis Nascimento on 9/24/16.
//  Copyright © 2016 THS Solution Ltda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong,nonatomic)  NavigationController *navigationController;
@property(nonatomic,strong) NSString *location;

+ (AppDelegate *)sharedAppDelegate;

@end

