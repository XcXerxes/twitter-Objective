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
    _cateCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 140, self.bounds.size.width, 200) collectionViewLayout: layout];
    _cateCollectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _cateCollectionView.delegate = self;
    _cateCollectionView.dataSource = self;
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
    NSString *iconName = [item objectForKey: @"iconName"];
    NSString *title = [item objectForKey:@"title"];
    NSLog(@"title======%@",title);
    UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: iconName]];
    UIView *cellView = [[UIView alloc] initWithFrame:cell.bounds];
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = title;
    titleLabel.textColor = ColorWhite;
    [cellView addSubview:titleLabel];
    NSLog(@"cellView=====%@", cellView);
    [cell.contentView addSubview:cellView];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.bounds.size.width / 4, self.bounds.size.width / 4);
}
@end
