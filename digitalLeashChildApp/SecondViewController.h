//
//  SecondViewController.h
//  digitalLeashChildApp
//
//  Created by Chad Wiedemann on 7/19/16.
//  Copyright © 2016 TurnToTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
- (IBAction)sendBackButton:(UIButton *)sender;

@end
