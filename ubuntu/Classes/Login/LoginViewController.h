//
//  LoginViewController.h
//  ubuntu
//
//  Created by Denis Nascimento on 9/24/16.
//  Copyright © 2016 THS Solution Ltda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface LoginViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UITextField *textLogin;
@property (weak, nonatomic) IBOutlet UITextField *textPassword;
- (IBAction)goToEnter:(id)sender;

- (IBAction)goToFacebook:(id)sender;


@end
