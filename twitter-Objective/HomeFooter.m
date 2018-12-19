//
//  HomeFooter.m
//  twitter-Objective
//
//  Created by Antony x on 19/12/2018.
//  Copyright © 2018 iotek. All rights reserved.
//

#import "HomeFooter.h"
#import "Constants.h"
#import "Masonry.h"

@interface HomeFooter()
<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UICollectionView *collectionView;
@end

NSString * const homeFooterCellId = @"homeFooterCellId";

@implementation HomeFooter
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"foooter=========");
        [self initContainerView];
        [self initTitle];
        [self initCollectionView];
    }
    return self;
}

-(void) initContainerView {
    _containerView = [UIView new];
    [self addSubview:_containerView];
    __weak typeof(self) wself = self;
    [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(wself).inset(10);
        make.width.mas_offset(wself.bounds.size.width - 20);
        make.height.mas_offset(wself.bounds.size.height - 20);
    }];
}

-(void) initTitle {
    _titleLabel = [UILabel new];
    _titleLabel.text = @"猜你喜欢";
    _titleLabel.textColor = ColorBlack;
    _titleLabel.font = [UIFont systemFontOfSize:16];
    [self.containerView addSubview:_titleLabel];
    __weak typeof(self) wself = self;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.top.equalTo(wself.containerView);
        make.height.mas_offset(30);
    }];
    UIView *leftLineView = [self customLineView];
    [self.containerView addSubview:leftLineView];
    [leftLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(wself.titleLabel);
        make.right.mas_equalTo(wself.titleLabel.mas_left).inset(10);
        make.width.mas_offset(26);
        make.height.mas_offset(1);
    }];
    UIView *rightLineView = [self customLineView];
    [self.containerView addSubview:rightLineView];
    [rightLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(leftLineView);
        make.width.height.equalTo(leftLineView);
        make.left.mas_equalTo(wself.titleLabel.mas_right).offset(10);
    }];
}
-(UIView *) customLineView {
    UIView *lineView = [UIView new];
    lineView.backgroundColor = ColorBlack;
    return lineView;
}

-(void) initCollectionView {
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.minimumLineSpacing = 15;
    flowLayout.minimumInteritemSpacing = 1;
    NSLog(@"=======%f", self.bounds.size.width);
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 40, self.bounds.size.width - 20, 600) collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = ColorThemeGray;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:homeFooterCellId];
    [self.containerView addSubview:_collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((self.collectionView.bounds.size.width - 10) / 2, 300);
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:homeFooterCellId forIndexPath:indexPath];
    UIView *cellView = [UIView new];
    cellView.backgroundColor = [UIColor orangeColor];
    [cell.contentView addSubview:cellView];
    [cellView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(cell.contentView);
        make.width.mas_equalTo(cell.contentView.mas_width);
        make.height.mas_offset(200);
    }];
    // 设置主体内容
    UIView *bodyView = [UIView new];
    bodyView.backgroundColor = ColorWhite;
    [cell addSubview:bodyView];
    [bodyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(cell.contentView);
        make.width.mas_equalTo(cell.contentView.mas_width);
        make.height.mas_offset(100);
    }];
    // 设置标题
    UILabel *nameLabel = [UILabel new];
    nameLabel.text = @"北京剧院2018年莎士比亚经典剧目";
    nameLabel.textColor = ColorBlack;
    nameLabel.font = [UIFont systemFontOfSize:16];
    nameLabel.numberOfLines = 1;
    [bodyView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(bodyView).inset(5);
        make.width.mas_offset(bodyView.bounds.size.width);
        make.height.mas_offset(30);
    }];
    return cell;
}
@end
