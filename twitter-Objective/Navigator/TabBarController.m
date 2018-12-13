//
//  TabBarController.m
//  twitter-Objective
//
//  Created by xiacan on 2018/12/10.
//  Copyright © 2018 iotek. All rights reserved.
//

#import "TabBarController.h"
#import "HomeViewController.h"
#import "FindViewController.h"
#import "TicketViewController.h"
#import "ProfileViewController.h"
#import "Navigation.h"

#import "Constants.h"

@interface TabBarController ()

@end

@implementation TabBarController

+ (void)initialize
{
    // 设置tabbar 的默认的颜色
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = ColorThemeBlack;
    
    // 设置选中时的颜色
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = ColorThemePurple;
    
    UITabBarItem *appearance = [UITabBarItem appearance];
    [appearance setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [appearance setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTabBarWithView:[HomeViewController new] title:@"推荐" image:@"home" selectedImage:@"home_selected"];
    [self initTabBarWithView:[FindViewController new] title:@"发现" image:@"find" selectedImage:@"find_selected"];
    [self initTabBarWithView:[TicketViewController new] title:@"票夹" image:@"ticket" selectedImage:@"ticket_selected"];
    [self initTabBarWithView:[ProfileViewController new] title:@"我的" image:@"profile" selectedImage:@"profile_selected"];
}

-(void) initTabBarWithView: (UIViewController *)viewController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    // 设置标题
    viewController.tabBarItem.title = title;
    // 设置默认的图片
    [viewController.tabBarItem setImage:[UIImage imageNamed:image]];
    // 设置选中时的图片
    [viewController.tabBarItem setSelectedImage:[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    // 设置根视图控制器
    UINavigationController *nav = [[Navigation alloc] initWithRootViewController:viewController];
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
