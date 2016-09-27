//
//  QueueViewController.h
//  ubuntu
//
//  Created by Denis Nascimento on 9/24/16.
//  Copyright © 2016 THS Solution Ltda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface QueueViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UIView *viewCancel;
@property (weak, nonatomic) IBOutlet UIView *pickerMotivos;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelMerchant;
@property (weak, nonatomic) IBOutlet UIImageView *imageCount;
@property (weak, nonatomic) IBOutlet UILabel *labelCount;

- (IBAction)goToCancel:(id)sender;
- (IBAction)goToClose:(id)sender;
- (IBAction)goToRequestCancel:(id)sender;

@end
