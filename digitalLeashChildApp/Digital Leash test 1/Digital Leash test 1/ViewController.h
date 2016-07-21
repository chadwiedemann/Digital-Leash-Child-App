//
//  ViewController.h
//  Digital Leash test 1
//
//  Created by Chad Wiedemann on 7/20/16.
//  Copyright © 2016 TurnToTech. All rights re/Users/chadwiedemann/Desktop/TurnToTech info/Digital Leash/digital Leash child and parent apps/digitalLeashChildApp/digitalLeashChildApp/Digital Leash test 1/Digital Leash test 1/ViewController.mserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UISlider *alphaSlider;
@property (nonatomic, strong) UIView *rectangle;
@property (weak, nonatomic) IBOutlet UILabel *hexLabel;

@end

