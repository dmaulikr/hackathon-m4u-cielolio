//
//  MapViewController.m
//  ubuntu
//
//  Created by Denis Nascimento on 9/24/16.
//  Copyright © 2016 THS Solution Ltda. All rights reserved.
//

#import "MapViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "PinAnnotation.h"
#import "Download.h"
#import "ServicesViewController.h"
#import "ServiceMerchants.h"
#import "MapViewController.h"
#import "HistoricViewController.h"
#import "FavoritesViewController.h"
#import "MyViewController.h"
#import "LoginViewController.h"

@interface MapViewController ()<CLLocationManagerDelegate,GMSAutocompleteViewControllerDelegate,MKMapViewDelegate>

@property(nonatomic,strong) CLLocationManager *locationManager;
@property(nonatomic,strong) NSArray *items;
@property(nonatomic,strong) NSArray *merchantsItems;
@property(nonatomic,assign) NSInteger index;

@end

@implementation MapViewController


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    
    self.viewSearch.layer.cornerRadius =  10;
    self.viewSearch.clipsToBounds = YES;
    self.viewSearch.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.viewSearch.layer.borderWidth = 1;
    
    self.tableView.tableFooterView = [UIView new];
    
    self.imageAvatar.layer.cornerRadius = 30;
    self.imageAvatar.clipsToBounds = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setStyleMain];
    [self createButtonMenu];
    [self createButtonSearch];
    
//    [self toSpeech:@"Você está na tela principal do aplicativo, escolha um local e clique para iniciar sua reserva"];
    [self setLogo];
    [self startLocationManager];
    self.mapView.showsUserLocation = NO;
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 25, 20)];
    self.textSearch.leftView = paddingView;
    self.textSearch.leftViewMode = UITextFieldViewModeAlways;
     self.items = @[@"Home",@"Minhas reservas",@"Meus Descontos",@"Histórico",@"Favoritos",@"Sair"];
    
    [self updateView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)showMenu{
    
    CGRect frame = self.viewMenu.frame;
    if (frame.origin.x < 0) {
        frame.origin.x = 0;
    }else{
        frame.origin.x = -300;
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        self.viewMenu.frame = frame;
    } completion:^(BOOL finished) {
        
    }];
}

-(void)updateView {
    
    [self startAnimate:YES];
    [Download merchants:^(BOOL success, id result) {
        
        if (success) {
            
            self.merchantsItems =  result;
            NSInteger count = 0;
            for ( ServiceMerchants *merchant in self.merchantsItems) {
                NSArray *tmp = [merchant.location componentsSeparatedByString:@","];
                CLLocationCoordinate2D coord;
                coord.latitude = [[tmp objectAtIndex:0]floatValue];
                coord.longitude = [[tmp objectAtIndex:1]floatValue];
                [self addPin:coord index:count];
                count ++;
            }
            [self.mapView showAnnotations:self.mapView.annotations animated:YES];
    [self startAnimate:NO];
        }
    }];
}

-(void)startLocationManager{
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
        [self.locationManager requestWhenInUseAuthorization];
    
    [self.locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    
    if(newLocation){
        [AppDelegate sharedAppDelegate].location = [NSString stringWithFormat:@"%f,%f",newLocation.coordinate.latitude,newLocation.coordinate.longitude];

    }
}

-(void)addPin:(CLLocationCoordinate2D)coordinate index:(NSInteger)index {
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.coordinate = coordinate;
    annotation.title = @"teste";
    annotation.subtitle = [NSString stringWithFormat:@"%ld",(long)index];
    
    [self.mapView addAnnotation:annotation];
    
}

- (void)viewController:(GMSAutocompleteViewController *)viewController didAutocompleteWithPlace:(GMSPlace *)place {
    
    if (place.coordinate.latitude && place.coordinate.longitude) {
        [self toSpeech:[NSString stringWithFormat:@"Você selecionou %@",place.name]];
        [self updateMapWithCoordinate:place.coordinate];
        self.textSearch.text = place.name;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewController:(GMSAutocompleteViewController *)viewController didFailAutocompleteWithError:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)wasCancelled:(GMSAutocompleteViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)updateMapWithCoordinate:(CLLocationCoordinate2D)coordinate{
    
    [self addPin:coordinate index:1];
    [self.mapView setShowsUserLocation:NO];
    [self.mapView showAnnotations:self.mapView.annotations animated:YES];
    
}

- (IBAction)goToSearch:(id)sender {
    
    [self toSpeech:@"Você está na tela de busca de locais, informe o nome do estabelecimento que deseja encontrar"];
    
    GMSAutocompleteViewController *acController = [[GMSAutocompleteViewController alloc] init];
    acController.delegate = self;
    [self presentViewController:acController animated:YES completion:nil];
    
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
    
    cell.textLabel.text = [self.items objectAtIndex:indexPath.row];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self showMenu];
//     self.items = @[@"Home",@"Minhas reservas",@"Meus Descontos",@"Histórico",@"Favoritos",@"Sair"];
//    switch (indexPath.row) {
//        case 0:{
//            MapViewController *vc = [MapViewController new];
//            [self.navigationController setViewControllers:@[vc] animated:YES];
//            break;
//        }
//        case 1:{
//            MyViewController *vc = [MyViewController new];
//            [self.navigationController setViewControllers:@[vc] animated:YES];
//            break;
//        }
//        case 2:{
//            MapViewController *vc = [MapViewController new];
//            [self.navigationController setViewControllers:@[vc] animated:YES];
//            break;
//        }
//        case 3:{
//            HistoricViewController *vc = [HistoricViewController new];
//            [self.navigationController setViewControllers:@[vc] animated:YES];
//            break;
//        }
//        case 4:{
//            FavoritesViewController *vc = [FavoritesViewController new];
//            [self.navigationController setViewControllers:@[vc] animated:YES];
//            break;
//        }
//        case 5:{
//            LoginViewController *vc = [LoginViewController new];
//            [self.navigationController setViewControllers:@[vc] animated:YES];
//            break;
//        }
//            
//        default:
//            break;
//    }
    
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
    
    static NSString *calloutIdentifier = @"CalloutAnnotation";
    
    CGSize            size = CGSizeMake(233.0, 68.0);
    MKAnnotationView *view = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:calloutIdentifier];
    view.frame             = CGRectMake(0.0, 0.0, 100, 100);
    view.backgroundColor   = [UIColor clearColor];
    view.canShowCallout    = NO;
    
    view.image = [UIImage imageNamed:[NSString stringWithFormat:@"Group%@",annotation.subtitle]];
    
    UIButton *button       = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame           = CGRectMake(0.0, 0.0, size.width, size.height);
    [button setBackgroundColor:[UIColor clearColor]];
    button.tag = [[annotation subtitle] integerValue];
    [button addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    

    return view;
    
}

-(void)tapButton:(UIButton*)button
{
    
    ServiceMerchants *merchant = [self.merchantsItems objectAtIndex:button.tag];
    [self toSpeech:[NSString stringWithFormat:@"Você selecionou %@",merchant.name]];
    ServicesViewController *vc = [ServicesViewController new];
    vc.merchants = [self.merchantsItems objectAtIndex:button.tag];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
