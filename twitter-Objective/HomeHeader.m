//
//  HomeHeader.m
//  twitter-Objective
//
//  Created by Antony x on 14/12/2018.
//  Copyright © 2018 iotek. All rights reserved.
//

#import "HomeHeader.h"
#import "Constants.h"
#import "SwipeView.h"
#import "HomeHeaderCell.h"
#import "Masonry.h"

NSString * const cellId = @"cellId";

@interface HomeHeader()
<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>
@property (nonatomic, strong) UICollectionView *cateCollectionView;
@property (nonatomic, copy) NSMutableArray *cateArray;

@end

@implementation HomeHeader
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化轮播图
        [self initSwipeView];
        // 初始化九宫格数据
        [self initCateList];
        // 初始化九宫格
        [self initCateCollectionView];
        [self initCaptionImage];
    }
    return self;
}

// 初始化轮播图
-(void) initSwipeView {
    SwipeView *swipeView = [SwipeView new];
    swipeView.frame = CGRectMake(0, 0, ScreenWidth, 140);
    [self addSubview:swipeView];
}

// 初始化 九宫格分类 菜单
-(void)initCateCollectionView {
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    _cateCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 140, self.bounds.size.width, 160) collectionViewLayout: layout];
    _cateCollectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _cateCollectionView.delegate = self;
    _cateCollectionView.dataSource = self;
    _cateCollectionView.backgroundColor = ColorWhite;
    [_cateCollectionView registerClass:[HomeHeaderCell class] forCellWithReuseIdentifier:cellId];
    [self addSubview:_cateCollectionView];
}

// 初始化 分类菜单的数据
-(void)initCateList {
    _cateArray = [NSMutableArray array];
    NSArray *array = @[@{@"title": @"演唱会",@"iconName":@"concert"}, @{@"title":@"话剧歌剧",@"iconName":@"drama"}, @{@"title":@"音乐会",@"iconName":@"musical"}, @{@"title":@"体育",@"iconName":@"sports"}, @{@"title": @"曲艺杂谈", @"iconName": @"quyi"}, @{@"title": @"亲子", @"iconName": @"child"}, @{@"title": @"展览休闲", @"iconName": @"exhibition"}, @{@"title": @"电影", @"iconName": @"movie"}];
    [_cateArray addObjectsFromArray:array];
}

// 返回个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _cateArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeHeaderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    NSDictionary *item = self.cateArray[indexPath.row];
    [cell initData:item];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.bounds.size.width / 4, self.bounds.size.width / 5);
}

// 初始化简要
-(void)initCaptionImage {
    UIView *view1 = [UIView new];
    view1.backgroundColor = [UIColor orangeColor];
    [self addSubview:view1];
    __weak typeof(self) wself = self;
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(wself.cateCollectionView.mas_bottom).mas_offset(10);
        make.left.equalTo(wself.cateCollectionView).mas_offset(15);
        make.width.mas_offset(240);
        make.height.mas_offset(120);
    }];
    UIView *view2 = [UIView new];
    view2.backgroundColor = [UIColor purpleColor];
    [self addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view1);
        make.right.mas_equalTo(wself.cateCollectionView.mas_right).inset(15);
        make.width.mas_offset(93);
        make.height.mas_offset(120);
    }];
    UIView *views = [UIView new];
    [self addSubview:views];
    [views mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }]
}

@end
