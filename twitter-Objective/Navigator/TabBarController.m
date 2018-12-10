//
//  TabBarController.m
//  twitter-Objective
//
//  Created by xiacan on 2018/12/10.
//  Copyright © 2018 iotek. All rights reserved.
//

#import "TabBarController.h"
#import "Navigation.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void) initTabBarWithView: (UIViewController *)viewController image:(NSString *)image selectedImage:(NSString *)selectedImage {
    // 设置默认的图片
    [viewController.tabBarItem setImage:[UIImage imageNamed:image]];
    // 设置选中时的图片
    [viewController.tabBarItem setSelectedImage:[UIImage imageNamed:selectedImage]];
    // 设置根视图控制器
    UINavigationController *nav = [[Navigation alloc] initWithRootViewController:viewController];
    viewController.tabBarController.tabBar.translucent = NO;
    [self addChildViewController:nav];
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
