//
//  SwipeViewController.m
//  twitter-Objective
//
//  Created by Antony x on 14/12/2018.
//  Copyright © 2018 iotek. All rights reserved.
//

#import "SwipeView.h"
#import "SDCycleScrollView.h"
#import "Constants.h"

@interface SwipeView ()
<
SDCycleScrollViewDelegate
>
@end

@implementation SwipeView

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSArray *imageNames = @[@"banner", @"banner1"];
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, 140) imageNamesGroup:imageNames];
        cycleScrollView.delegate = self;
        // cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        // cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        [self addSubview:cycleScrollView];
    }
    return self;
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
