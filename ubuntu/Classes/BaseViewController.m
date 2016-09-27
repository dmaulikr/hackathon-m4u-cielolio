//
//  BaseViewController.m
//  ubuntu
//
//  Created by Denis Nascimento on 9/24/16.
//  Copyright © 2016 THS Solution Ltda. All rights reserved.
//

#import "BaseViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface BaseViewController ()<AVSpeechSynthesizerDelegate>

@property(nonatomic,strong)  AVSpeechSynthesizer *speechSynthesizer;
@property(nonatomic,strong) UIView *viewLoading;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
    [self loading];
}

-(void)loading{
    
    self.viewLoading = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    self.viewLoading.backgroundColor = [UIColor clearColor];
    UIView *viewBG = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    viewBG.backgroundColor = [UIColor blackColor];
    viewBG.alpha = 0.7;
    [self.viewLoading addSubview:viewBG];
    
    UIActivityIndicatorView *act = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    act.center = self.viewLoading.center;
    [act startAnimating];
    [self.viewLoading addSubview:act];
    [self.view addSubview:self.viewLoading];
    self.viewLoading.hidden = YES;
}

-(void)startAnimate:(BOOL)hidden{
    self.viewLoading.hidden = !hidden;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)toSpeech:(NSString*)text {
    
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:text];
    [self.speechSynthesizer speakUtterance:utterance];
    
}


- (void)showMenu
{
    
}

-(void)createButtonMenu
{
    UIBarButtonItem	*addButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icpn_menu"] style:UIBarButtonItemStyleDone target:self action:@selector(showMenu)];
    self.navigationItem.leftBarButtonItem = addButton;
    self.navigationItem.leftBarButtonItem.enabled = YES;
}

-(void)createButtonSearch
{
    UIBarButtonItem *setting = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"setting"] style:UIBarButtonItemStyleDone target:self action:@selector(setting)];
    self.navigationItem.rightBarButtonItem = setting;
    self.navigationItem.rightBarButtonItem.enabled = YES;
}

-(void)setting{
    
}

-(void)setLogo
{
    UIImage *image = [UIImage imageNamed: @"casa"];
    UIImageView *imageview = [[UIImageView alloc] initWithImage: image];
    self.navigationItem.titleView = imageview;    
}


-(void)setStyleMain
{
    
    [self.navigationController.navigationBar setTranslucent:NO];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.barTintColor =  [UIColor whiteColor];
    
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIColor blackColor],NSForegroundColorAttributeName,
                                    [UIColor blackColor],NSBackgroundColorAttributeName,nil];
    
    self.navigationController.navigationBar.titleTextAttributes = textAttributes;
    
}

-(void)setStyleDefault
{
    
    UIButton *buttonNavBack = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonNavBack setImage:[UIImage imageNamed:@"voltar"] forState:UIControlStateNormal];
    [buttonNavBack setTitleColor:[UIColor colorWithRed:0.188f green:0.278f blue:0.322f alpha:1.00f] forState:UIControlStateNormal];
    [buttonNavBack addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [buttonNavBack sizeToFit];
    buttonNavBack.imageEdgeInsets = UIEdgeInsetsMake(0,-20, 0, 0);
    buttonNavBack.titleLabel.textAlignment = NSTextAlignmentLeft;
    
    UIBarButtonItem* customBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:buttonNavBack];
    self.navigationItem.leftBarButtonItem = customBarButtonItem;
    self.navigationItem.leftBarButtonItem.enabled = YES;
    
    
    [self.navigationController.navigationBar setTranslucent:NO];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.barTintColor =  [UIColor whiteColor];
    
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIColor blackColor],NSForegroundColorAttributeName,
                                    [UIColor blackColor],NSBackgroundColorAttributeName,nil];
    
    self.navigationController.navigationBar.titleTextAttributes = textAttributes;
    
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)alertViewWithMessage:(NSString*)message  button:(NSString*)button
{
    
    if(!button)
        button = @"Ok";
    
    [[[UIAlertView alloc]initWithTitle:@"Sua Vez"  message:message delegate:nil cancelButtonTitle:button otherButtonTitles:nil, nil]show];
    
}

@end
