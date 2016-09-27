//
//  HistoricViewController.m
//  ubuntu
//
//  Created by Denis Nascimento on 9/25/16.
//  Copyright © 2016 THS Solution Ltda. All rights reserved.
//

#import "HistoricViewController.h"

@interface HistoricViewController ()
@property(nonatomic,strong) NSArray *items ;
@end

@implementation HistoricViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setStyleMain];
    [self createButtonMenu];
    self.tableView.tableFooterView = [UIView new];
    self.title = @"Histórico";
    [self toSpeech:@"Você está na tela de Histórico"];
    
//    [self updateView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


-(void)updateView {
    
    [Download products:^(BOOL success, id result) {
        if (success) {
            self.items = (NSArray*)result;
            [self.tableView reloadData];
        }
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
    return 45;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
//    ServiceProducts *product =  [self.items objectAtIndex:indexPath.row];
    
    cell.textLabel.text =  [self.items objectAtIndex:indexPath.row];
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",product.price];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}



@end
