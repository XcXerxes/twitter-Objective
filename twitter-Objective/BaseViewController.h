//
//  BaseViewController.h
//  twitter-Objective
//
//  Created by Antony x on 13/12/2018.
//  Copyright © 2018 iotek. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController
// 设置导航背景颜色
-(void) setNavigationBarBackgroundColor: (UIColor *)color;

-(void) setNavigationBarTranslucent;
@end

NS_ASSUME_NONNULL_END
