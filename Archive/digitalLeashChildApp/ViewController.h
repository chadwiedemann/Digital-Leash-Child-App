//
//  ViewController.h
//  digitalLeashChildApp
//
//  Created by Chad Wiedemann on 7/12/16.
//  Copyright © 2016 TurnToTech. All rights reserved.
//
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>
#import "SecondViewController.h"
#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (strong, nonatomic) NSString *latitude;
@property (nonatomic, strong) NSString *longitude;
@property (nonatomic, strong) NSData *childJSONData;
@property (nonatomic, strong) NSMutableURLRequest *request;
@property (weak, nonatomic) IBOutlet UIButton *reportButton;
@property (nonatomic, strong) SecondViewController *secondVC;


@end

