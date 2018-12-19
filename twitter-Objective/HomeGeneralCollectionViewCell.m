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
<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *moreBtn;
@property (nonatomic, strong) UIView *bannerView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIView *itemView;
@end

@implementation HomeGeneralCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initContainerView];
        [self initView];
        [self initTableView];
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
    [_moreBtn setImage:[UIImage imageNamed:@"home_more"] forState:UIControlStateNormal];
    _moreBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 73, 0, 0);
    _moreBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_moreBtn setTitleColor:ColorThemeBlack forState:UIControlStateNormal];
    [self.containerView addSubview:_moreBtn];
    [_moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(wself.titleLabel);
        make.right.equalTo(wself.containerView);
        make.width.mas_equalTo(100);
    }];
    [_moreBtn addTarget:self action:@selector(pressMore:) forControlEvents:UIControlEventTouchUpInside];
    // banner
    _bannerView = [UIView new];
    _bannerView.backgroundColor = ColorThemePurple;
    [self.containerView addSubview:_bannerView];
    [_bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(wself.titleLabel.mas_bottom).offset(15);
        make.width.mas_equalTo(wself.containerView.mas_width);
        make.height.mas_offset(200);
    }];
}
// 初始化 tableView
-(void) initTableView {
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 1;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 250, self.containerView.bounds.size.width, 400) collectionViewLayout:flowLayout];
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = ColorWhite;
    [self.containerView addSubview:_collectionView];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"genercellId"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"genercellId" forIndexPath:indexPath];
    UIView *itemView = [UIView new];
    itemView.backgroundColor = ColorThemePurple;
    [cell.contentView addSubview:itemView];
    [itemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(cell.contentView);
        make.width.mas_equalTo(cell.contentView.mas_width);
        make.height.mas_offset(150);
    }];
    UILabel *itemLabel = [UILabel new];
    itemLabel.text = @"2018圣诞节平安夜重磅活动";
    itemLabel.textColor = ColorBlack;
    itemLabel.font = [UIFont systemFontOfSize:16];
    itemLabel.numberOfLines = 1;
    [cell.contentView addSubview:itemLabel];
    [itemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(itemView.mas_bottom);
        make.width.equalTo(cell.contentView.mas_width);
        make.height.mas_offset(30);
        make.left.right.equalTo(itemView);
    }];
    UILabel *dateLabel = [UILabel new];
    dateLabel.text = @"2019.01.13 19:30";
    dateLabel.textColor = ColorThemeBlack;
    dateLabel.font = [UIFont systemFontOfSize:12];
    [cell.contentView addSubview:dateLabel];
    [dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(itemLabel.mas_bottom);
        make.left.right.equalTo(itemLabel);
        make.width.mas_equalTo(itemLabel.mas_width);
        make.height.mas_offset(20);
    }];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((self.containerView.bounds.size.width-20) / 3, 200);
}

-(void) pressMore:(UIButton *)btn {
    NSLog(@"......s");
}
@end
