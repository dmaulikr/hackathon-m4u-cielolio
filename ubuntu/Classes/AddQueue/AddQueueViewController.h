//
//  AddQueueViewController.h
//  ubuntu
//
//  Created by Denis Nascimento on 9/24/16.
//  Copyright © 2016 THS Solution Ltda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "ServiceMerchants.h"
#import "ServiceProducts.h"

@interface AddQueueViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UIButton *btnAdd;
@property (weak, nonatomic) IBOutlet UIImageView *imageCapa;
@property (weak, nonatomic) IBOutlet UILabel *labelContent;
@property (weak, nonatomic) IBOutlet UILabel *labelCount;
@property (strong, nonatomic) NSString *service;
@property (weak, nonatomic) IBOutlet UIView *viewPicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *pickerDate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong) ServiceMerchants *merchants;
@property(nonatomic,strong) ServiceProducts *product;




- (IBAction)closeViewPicker:(id)sender;
- (IBAction)goToEnterQueue:(id)sender;

@end
