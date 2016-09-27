//
//  AddCell.m
//  ubuntu
//
//  Created by Denis Nascimento on 9/25/16.
//  Copyright © 2016 THS Solution Ltda. All rights reserved.
//

#import "AddCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation AddCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}

-(void)setContent:(Professional*)professional{
    
    self.labelName.text = professional.name;
    
    NSString *str = self.calendar.datetime;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"YYYY-MM-dd\'T\'HH:mm:ssZZZZZ"];
    NSDate *dte = [dateFormat dateFromString:str];
    [dateFormat setDateFormat:@"dd/MM/yyyy HH:mm"];
    NSString *date_ =  [NSString stringWithFormat:@"%@",[dateFormat stringFromDate:dte]];
    
    self.labelDetail.text = date_;
    
    
    self.imageAvatar.layer.cornerRadius = 20;
    
    self.imageAvatar.clipsToBounds = YES;
    [self.imageAvatar sd_setImageWithURL:[NSURL URLWithString:professional.photo]
                      placeholderImage:[UIImage imageNamed:@"placeholder_post"]
                             completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                 self.imageAvatar.image = image;
                             }];
}

@end
