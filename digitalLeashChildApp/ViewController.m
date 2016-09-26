//
//  ViewController.m
//  digitalLeashChildApp
//
//  Created by Chad Wiedemann on 7/12/16.
//  Copyright © 2016 TurnToTech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//declaring a local instance variable
{
    CLLocationManager *locationmanager;
}


@end

@implementation ViewController
//lazy instantiation
-(NSMutableURLRequest *)request
{
    if(!_request)
    {
        _request = [[NSMutableURLRequest alloc]init];
    }
    return _request;
}


- (void)viewDidLoad {
    [super viewDidLoad];//loading the main view
    self.view.backgroundColor = UIColorFromRGB(0x7fb439);//setting the main view as the specified hexidecimal color
    
    self.reportButton.backgroundColor = [UIColor whiteColor];//set report button background
    self.reportButton.layer.cornerRadius = 15;//round out the corners of the report button
    self.reportButton.layer.borderWidth = 1;//had a boarder to the report button
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.secondVC = (SecondViewController *)[sb instantiateViewControllerWithIdentifier:@"SVC"];
    
    locationmanager = [[CLLocationManager alloc]init];
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}








- (IBAction)reportLocationButton:(id)sender {
    NSLog(@"button pressed");
    
    [locationmanager requestAlwaysAuthorization];
    
    locationmanager.delegate = self;
    locationmanager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationmanager startUpdatingLocation];
    [self presentViewController:self.secondVC animated:YES completion:^(void){}];
    
    
    
}

-(void) sendInformationToCloud{
    NSDictionary *childDict = @{@"username" : self.userNameTextField.text, @"current_latitude" : self.latitude, @"current_longitude" : self.longitude};
    
    NSError* error;
    self.childJSONData = [NSJSONSerialization dataWithJSONObject:childDict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *leashURL = [NSString stringWithFormat: @"https://turntotech.firebaseio.com/digitalleash/%@.json",self.userNameTextField.text];
    
    NSURL *url = [NSURL URLWithString:leashURL];
    
    
    //    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    //    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    
    self.request.URL = url;
    self.request.HTTPMethod = @"PATCH";
    self.request.HTTPBody = self.childJSONData;
    
NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:self.request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error){
            NSLog(@"%@",error.localizedDescription);
        }
    }];
    
    [dataTask resume];
 
    
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations
{
    NSLog(@"didUpdateToLocation: %@", locations[0]);
    CLLocation *currentLocation = locations[0];
    
    if (currentLocation != nil) {
        self.longitude = [NSString stringWithFormat:@"%.8f", locations[0].coordinate.longitude];
        self.latitude = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        [self sendInformationToCloud];
    }
}


@end
