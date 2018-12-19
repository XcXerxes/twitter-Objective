//
//  HomeViewController.m
//  twitter-Objective
//
//  Created by Antony x on 13/12/2018.
//  Copyright © 2018 iotek. All rights reserved.
//

#import "HomeViewController.h"
#import "Masonry.h"
#import "Constants.h"
#import "HomeHeader.h"
#import "HomeGeneralCollectionViewCell.h"

NSString * const homeHeaderId = @"homeHeaderId";
NSString * const homeCellId = @"homeCellId";

@interface HomeViewController ()
<
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout,
UICollectionViewDataSource
>
@property (nonatomic, strong) UIBarButtonItem *leftBtn;
@property (nonatomic, strong) UIBarButtonItem *rightQRBtn;
@property (nonatomic, strong) UIBarButtonItem *rightNoticeBtn;
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 设置navigationItem
    [self initNavigationItems];
    // 设置轮播图
    // [self initSwipeView];
    // 初始化collectionView
    [self initCollectionView];
}

-(void) initNavigationItems {
    UIButton *locationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    locationBtn.frame = CGRectMake(0, 0, 50, 40);
    // 设置定位按钮的图片
    [locationBtn setImage:[UIImage imageNamed:@"location"] forState:UIControlStateNormal];
    // 设置按钮的文字
    [locationBtn setTitle:@"北京" forState:UIControlStateNormal];
    locationBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    locationBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    locationBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    [locationBtn setTitleColor:ColorThemeBlack forState:UIControlStateNormal];
    [locationBtn addTarget:self action:@selector(navigationPress:) forControlEvents:UIControlEventTouchUpInside];
    _leftBtn = [[UIBarButtonItem alloc] initWithCustomView:locationBtn];
    self.navigationItem.leftBarButtonItem = _leftBtn;
    NSArray *arr = @[@"qr", @"notice"];
    NSMutableArray *rightBtns = [NSMutableArray array];
    for (int i=0; i<arr.count; i++) {
        UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:arr[i]] style:UIBarButtonItemStylePlain target:self action:@selector(navigationPress:)];
        rightBtn.tag = 1002+i;
        [rightBtn setTintColor:ColorThemeBlack];
        [rightBtns addObject:rightBtn];
    }
    self.navigationItem.rightBarButtonItems = rightBtns;
    
    // 设置搜索框
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 35)];
    textField.placeholder = @"搜索关键字";
    textField.backgroundColor = ColorThemeGray;
    textField.layer.cornerRadius = 14;
    textField.layer.masksToBounds = YES;
    textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 12, 0)];
    textField.leftViewMode = UITextFieldViewModeAlways;
    [self.navigationItem.titleView sizeToFit];
    self.navigationItem.titleView = textField;
    
}

// 导航点击事件
-(void) navigationPress:(UIBarButtonItem *)btn {
    NSLog(@"点击了....");
}

// 初始化collectionView
-(void) initCollectionView {
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[UICollectionViewFlowLayout new]];
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _collectionView.backgroundColor = ColorWhite;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[HomeHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:homeHeaderId];
    [_collectionView registerClass:[HomeGeneralCollectionViewCell class] forCellWithReuseIdentifier:homeCellId];
    [self.view addSubview:_collectionView];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 7;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeGeneralCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:homeCellId forIndexPath:indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(ScreenWidth, 800);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    HomeHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:homeHeaderId forIndexPath:indexPath];
    return header;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(ScreenWidth, 500);
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
