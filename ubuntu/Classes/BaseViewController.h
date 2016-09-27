//
//  BaseViewController.h
//  ubuntu
//
//  Created by Denis Nascimento on 9/24/16.
//  Copyright © 2016 THS Solution Ltda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Download.h"

@interface BaseViewController : UIViewController

-(void)createButtonMenu;
-(void)setStyleMain;
-(void)setStyleDefault;
-(void)toSpeech:(NSString*)text;
-(void)startAnimate:(BOOL)hidden;
-(void)setLogo;
-(void)createButtonSearch;
-(void)alertViewWithMessage:(NSString*)message  button:(NSString*)button;
@end
