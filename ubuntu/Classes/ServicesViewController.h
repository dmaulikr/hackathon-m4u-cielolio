//
//  ServicesViewController.h
//  ubuntu
//
//  Created by Denis Nascimento on 9/24/16.
//  Copyright © 2016 THS Solution Ltda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "ServiceMerchants.h"

@interface ServicesViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageCapa;
@property (weak, nonatomic) IBOutlet UILabel *labelContent;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) ServiceMerchants *merchants;

@end
