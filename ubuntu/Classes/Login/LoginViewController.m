//
//  LoginViewController.m
//  ubuntu
//
//  Created by Denis Nascimento on 9/24/16.
//  Copyright © 2016 THS Solution Ltda. All rights reserved.
//

#import "LoginViewController.h"
#import "MapViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self toSpeech:@"Bem vindo ao Cielo cheque in"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)goToEnter:(id)sender {
    
 //   [self toSpeech:@"Você clicou em entrar"];
    MapViewController *vc = [MapViewController new];
    [self.navigationController setViewControllers:@[vc] animated:YES];
    
//   [self.navigationController pushViewController:vc animated:YES];
    
}

- (IBAction)goToFacebook:(id)sender {
 
    //   [self toSpeech:@"Você clicou em entrar com o Feicebook"];
    MapViewController *vc = [MapViewController new];
     [self.navigationController setViewControllers:@[vc] animated:YES];
//    [self.navigationController pushViewController:vc animated:YES];
}
@end
