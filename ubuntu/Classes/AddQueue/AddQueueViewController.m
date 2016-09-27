//
//  AddQueueViewController.m
//  ubuntu
//
//  Created by Denis Nascimento on 9/24/16.
//  Copyright © 2016 THS Solution Ltda. All rights reserved.
//

#import "AddQueueViewController.h"
#import "ServiceQueue.h"
#import "Download.h"
#import "ServiceReturnQueue.h"
#import "ServiceProfessionals.h"
#import "ServiceCalendar.h"
#import "Professional.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "AddCell.h"
#import "UIView+NibLoading.h"

@interface AddQueueViewController ()

@property(nonatomic,strong) NSArray *items;
@property(nonatomic,strong) ServiceCalendar *currentCalendar;

@end

@implementation AddQueueViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setStyleDefault];
    self.tableView.tableFooterView = [UIView new];
    [self toSpeech:@"Você está na tela reserva"];
    self.title = self.product.name;
    self.btnAdd.enabled = NO;
    
    [self updateView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)updateView {
    
    [self startAnimate:YES];
    [Download calendarWith:self.merchants.url product:self.product.internalBaseClassIdentifier completion:^(BOOL success, id result) {
        if (success) {
            self.items = (NSArray*)result;
            [self.tableView reloadData];
        }
        [self startAnimate:NO];
    }];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return self.items.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    AddCell *cell = [tableView dequeueReusableCellWithIdentifier:@"historicCell"];
    if (cell == nil)
    {
        cell = [UIView viewWithNibName:@"AddCell"];
    }
    ServiceCalendar *calendar = [self.items objectAtIndex:indexPath.row];
    cell.calendar = calendar;
    [cell setContent:calendar.professional];
    return cell;
    

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ServiceCalendar *calendar = [self.items objectAtIndex:indexPath.row];
      
    NSArray *tmp = [calendar.datetime componentsSeparatedByString:@"T"];
    NSArray *date = [[tmp objectAtIndex:0]componentsSeparatedByString:@"-"];
    
    NSArray *time = [[tmp objectAtIndex:1]componentsSeparatedByString:@":"];
    
    NSString *date_ =[NSString stringWithFormat:@"%@/%@/%@ às %ld:%@",[date objectAtIndex:2],[date objectAtIndex:1],[date objectAtIndex:0],([[time objectAtIndex:0]integerValue]-3),[time objectAtIndex:1]];
    
    
    [self toSpeech:[NSString stringWithFormat:@"Você Selecionou %@, para o dia %@",calendar.professional.name,date_]];
    self.currentCalendar = calendar;
    self.btnAdd.enabled = YES;
}

- (IBAction)closeViewPicker:(id)sender {
    
    CGRect frame = self.viewPicker.frame;
    if (self.viewPicker.frame.origin.y >= [UIScreen mainScreen].bounds.size.height) {
        frame.origin.y =  [UIScreen mainScreen].bounds.size.height-220;
    }else{
        frame.origin.y =  [UIScreen mainScreen].bounds.size.height;
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        self.viewPicker.frame = frame;
    } completion:^(BOOL finished) {
       
    }];
    
}

- (IBAction)goToEnterQueue:(id)sender {
    
    ServiceQueue *queue = [ServiceQueue modelObjectWithDictionary:nil];
    queue.name = @"Walmyr Carvalho";
    queue.location = [AppDelegate sharedAppDelegate].location;
    queue.photo = @"";
    queue.phone = @"";
    queue.url = self.currentCalendar.url;

    [self startAnimate:YES];
    [Download insertQueueWithUrl:self.merchants.url queue:queue completion:^(BOOL success, id result) {
        if (success) {
            ServiceReturnQueue *service = [ServiceReturnQueue modelObjectWithDictionary:(NSDictionary*)result];
            if (service) {
                [self alertViewWithMessage:@"Reserva realizada com sucesso" button:@"OK"];
                [self toSpeech:@"Reserva realizada com sucesso"];
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }
        [self startAnimate:NO];
    }];
    
    
}

-(void)setDate{
    
    NSDate *datePickerDate = [self.pickerDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/yyyy H:mm"];
    [self.btnAdd setTitle:[formatter stringFromDate:datePickerDate] forState:UIControlStateNormal];
}


@end
