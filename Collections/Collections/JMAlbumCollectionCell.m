//
//  JMAlbumCollectionCell.m
//  PhotoLock
//
//  Created by 赵俊明 on 2017/7/15.
//  Copyright © 2017年 赵俊明. All rights reserved.
//

#import "JMAlbumCollectionCell.h"

@interface JMAlbumCollectionCell()
@property (nonatomic, strong) UIImageView *leftBtn;
@end

@implementation JMAlbumCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor grayColor];
        
        _leftBtn = [[UIImageView alloc] initWithFrame:CGRectZero];
        _leftBtn.contentMode = UIViewContentModeScaleAspectFill;
        _leftBtn.clipsToBounds = YES;
        [self.contentView addSubview:_leftBtn];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _leftBtn.frame = self.bounds;
}

- (void)setModel:(NSString *)model
{
    _model = model;
    _leftBtn.image = [UIImage imageNamed:@"16.03.33"];
}

@end
