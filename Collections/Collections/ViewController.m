//
//  ViewController.m
//  Collections
//
//  Created by JM Zhao on 2017/8/29.
//  Copyright © 2017年 JunMing. All rights reserved.
//

#import "ViewController.h"
#import "JMAlbumCollectionCell.h"
#define kW [UIScreen mainScreen].bounds.size.width
#define kH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionViewFlowLayout *_layout;
    NSArray *_photosTemp;
    NSArray *_assetsTemp;
    CGFloat _offsetItemCount;
}
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, assign) BOOL isHideNaviBar;
@end

@implementation ViewController

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _layout = layout;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.pagingEnabled = YES;
    collectionView.scrollsToTop = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:collectionView];
    [collectionView registerClass:[JMAlbumCollectionCell class] forCellWithReuseIdentifier:@"JMImageCollectionCell"];
    self.collectionView = collectionView;

}

#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(kW, kW);
}

// 动态设置每个分区的EdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

// 动态设置每行的间距大小
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

// 动态设置每列的间距大小
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

#pragma mark - UICollectionViewDataSource && Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JMAlbumCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JMImageCollectionCell" forIndexPath:indexPath];
    cell.model = @"dd";
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    if (scrollView == self.collectionView) {
        
        CGPoint currentCellOffset = self.collectionView.contentOffset;
        
        CGFloat num = currentCellOffset.x / kW;
        
        NSLog(@"%@--%f", NSStringFromCGPoint(currentCellOffset), num);
        
        currentCellOffset.x -= 100;
        
        CGPoint cuP = CGPointMake(num*kW, currentCellOffset.y);
        NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:cuP];
        [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
}


//- (void) scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
//    
//    CGFloat offSetX = targetContentOffset->x; //偏移量
//    
//    CGFloat itemWidth = kW-100;   //itemSizem 的宽
//    
//    //itemSizem的宽度+行间距 = 页码的宽度
//    
//    NSInteger pageWidth = itemWidth + 30;
//    
//    //根据偏移量计算 第几页
//    
//    NSInteger pageNum = (offSetX+pageWidth/2)/pageWidth;
//    
//    //根据显示的第几页,从而改变偏移量
//    
//    targetContentOffset->x = pageNum*pageWidth;
//    
//    NSLog(@"%.1f",targetContentOffset->x);
//    
//}


@end
