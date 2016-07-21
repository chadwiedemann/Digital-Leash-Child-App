//
//  SecondViewController.m
//  digitalLeashChildApp
//
//  Created by Chad Wiedemann on 7/19/16.
//  Copyright © 2016 TurnToTech. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0x7fb439);
    
    self.doneButton.backgroundColor = [UIColor whiteColor];
    self.doneButton.layer.cornerRadius = 15;
    self.doneButton.layer.borderWidth = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



- (IBAction)sendBackButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^(void){}];
    
}
@end
