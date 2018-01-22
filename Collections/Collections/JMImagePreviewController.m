//
//  JMImagePreviewController.m
//  PhotosManger
//
//  Created by JM Zhao on 2017/8/24.
//  Copyright © 2017年 JunMing. All rights reserved.
//

#import "JMImagePreviewController.h"
#import "JMAlbumCollectionCell.h"
#define kW [UIScreen mainScreen].bounds.size.width
#define kH [UIScreen mainScreen].bounds.size.height

@interface JMImagePreviewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionViewFlowLayout *_layout;
    NSArray *_photosTemp;
    NSArray *_assetsTemp;
    CGFloat _offsetItemCount;
}
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, assign) BOOL isHideNaviBar;
@end

@implementation JMImagePreviewController

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    }

- (void)setupUI
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _layout = layout;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.contentSize = CGSizeMake(self.models.count * (kW + 20), 0);
    collectionView.backgroundColor = [UIColor blackColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.pagingEnabled = YES;
    collectionView.scrollsToTop = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:collectionView];
    [collectionView registerClass:[JMAlbumCollectionCell class] forCellWithReuseIdentifier:@"JMImageCollectionCell"];
    self.collectionView = collectionView;
}

#pragma mark - UICollectionViewDataSource && Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _models.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    JMAlbumCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JMImageCollectionCell" forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell isKindOfClass:[JMAlbumCollectionCell class]]) {
        
    }
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell isKindOfClass:[JMAlbumCollectionCell class]]) {
        
    }
}

- (void)didChangeStatusBarOrientationNotification:(NSNotification *)noti
{
    _offsetItemCount = _collectionView.contentOffset.x / _layout.itemSize.width;
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
