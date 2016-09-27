//
//  RecursosNavController.m
//  Recursos
//
//  Created by Denis Nascimento on 5/15/15.
//  Copyright (c) 2015 Denis Nascimento. All rights reserved.
//

#import "NavigationController.h"


@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad
{
  [super viewDidLoad];
    
  [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)]];
  if([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
   
  }
    self.navigationBar.backgroundColor = [UIColor whiteColor];
}



#pragma mark -
#pragma mark Gesture recognizer

- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender
{

  [self.view endEditing:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




@end
