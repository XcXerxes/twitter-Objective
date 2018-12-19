//
//  HomeHeaderCell.m
//  twitter-Objective
//
//  Created by Antony x on 14/12/2018.
//  Copyright © 2018 iotek. All rights reserved.
//

#import "HomeHeaderCell.h"

@interface HomeHeaderCell()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *iconImageView;
@end

@implementation HomeHeaderCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}
- (void) initView {
    _iconImageView = [[UIImageView alloc] initWithImage:[UIImage new]];
    _iconImageView.frame = CGRectMake((self.bounds.size.width/2) - 16, (self.bounds.size.height/2) - 21, 32, 32);
    UIView *cellView = [[UIView alloc] initWithFrame:self.bounds];
    _titleLabel = [UILabel new];
    _titleLabel.frame = CGRectMake((self.bounds.size.width /2) - 50, (self.bounds.size.height/2) + 5, 100, 30);
    _titleLabel.text = @"123";
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont systemFontOfSize:10];
    [cellView addSubview:_titleLabel];
    [cellView addSubview:_iconImageView];
    [self addSubview:cellView];
}
- (void) initData:(NSDictionary *)cateInfo {
    [self.titleLabel setText:[cateInfo objectForKey:@"title"]];
    [self.iconImageView setImage:[UIImage imageNamed:[cateInfo objectForKey:@"iconName"]]];
    
}

-(void)initCellView {
    
}
@end
