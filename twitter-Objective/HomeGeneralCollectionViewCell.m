//
//  HomeGeneralCollectionViewCell.m
//  twitter-Objective
//
//  Created by Antony x on 15/12/2018.
//  Copyright © 2018 iotek. All rights reserved.
//

#import "HomeGeneralCollectionViewCell.h"
#import "Constants.h"
#import "Masonry.h"

@interface HomeGeneralCollectionViewCell ()
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *moreBtn;
@end

@implementation HomeGeneralCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initContainerView];
        [self initView];
    }
    return self;
}
-(void) initContainerView {
    _containerView = [UIView new];
    [self.contentView addSubview:_containerView];
    __weak typeof(self) wself = self;
    [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(wself.contentView).inset(10);
        make.width.mas_offset(wself.contentView.bounds.size.width - 20);
        make.height.mas_offset(wself.contentView.bounds.size.height - 20);
    }];
}
-(void) initView {
    _titleLabel = [UILabel new];
    _titleLabel.text = @"演唱会";
    _titleLabel.textColor = ColorBlack;
    _titleLabel.font = [UIFont systemFontOfSize:20];
    [self.containerView addSubview:_titleLabel];
    __weak typeof(self) wself = self;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(wself.containerView);
        make.width.mas_offset(100);
        make.height.mas_offset(30);
    }];
    _moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_moreBtn setTitle:@"更多" forState:UIControlStateNormal];
    _moreBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_moreBtn setTitleColor:ColorThemeBlack forState:UIControlStateNormal];
    [self.containerView addSubview:_moreBtn];
    [_moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(wself.titleLabel);
        make.right.equalTo(wself.containerView);
    }];
}
@end
