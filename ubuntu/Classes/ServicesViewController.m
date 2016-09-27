//
//  ServicesViewController.m
//  ubuntu
//
//  Created by Denis Nascimento on 9/24/16.
//  Copyright © 2016 THS Solution Ltda. All rights reserved.
//

#import "ServicesViewController.h"
#import "AddQueueViewController.h"
#import "ServiceProducts.h"

@interface ServicesViewController ()
@property(nonatomic,strong) NSArray *items ;

@end

@implementation ServicesViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setStyleDefault];
    self.tableView.tableFooterView = [UIView new];
    self.title = self.merchants.name;
//    [self toSpeech:@"Você está na tela de escolha de serviço, selecione um para continuar"];
    
    [self updateView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)updateView {
    [self startAnimate:YES];
    [Download products:^(BOOL success, id result) {
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
    return 44;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    ServiceProducts *product =  [self.items objectAtIndex:indexPath.row];
    cell.textLabel.text = product.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"R$ %.2f",([product.price doubleValue]/100)];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ServiceProducts *product =  [self.items objectAtIndex:indexPath.row];
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle: NSNumberFormatterDecimalStyle];
    
    [self toSpeech:[NSString stringWithFormat:@"Você Selecionou %@ que custa %@",product.name, [NSString stringWithFormat:@"R$ %ld",([product.price integerValue]/100)]]];
    AddQueueViewController *vc = [AddQueueViewController new];
    vc.merchants = self.merchants;
    vc.product = product;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
