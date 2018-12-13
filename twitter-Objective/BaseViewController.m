//
//  BaseViewController.m
//  twitter-Objective
//
//  Created by Antony x on 13/12/2018.
//  Copyright © 2018 iotek. All rights reserved.
//

#import "BaseViewController.h"
#import "Constants.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setNavigationBarTranslucent];
    [self setNavigationBarBackgroundColor: ColorWhite];
}
- (void)setNavigationBarTranslucent {
    self.navigationController.navigationBar.translucent = NO;
}

- (void)setNavigationBarBackgroundColor:(UIColor *)color {
    self.navigationController.navigationBar.backgroundColor = color;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
