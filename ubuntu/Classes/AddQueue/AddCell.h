//
//  AddCell.h
//  ubuntu
//
//  Created by Denis Nascimento on 9/25/16.
//  Copyright © 2016 THS Solution Ltda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Professional.h"
#import "ServiceCalendar.h"

@interface AddCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageAvatar;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelDetail;
@property(nonatomic,strong) ServiceCalendar *calendar;

-(void)setContent:(Professional*)professional;

@end
