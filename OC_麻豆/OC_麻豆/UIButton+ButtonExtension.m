//
//  UIButton+ButtonExtension.m
//  OC_麻豆
//
//  Created by JM Zhao on 2017/5/22.
//  Copyright © 2017年 JunMing. All rights reserved.
//

#import "UIButton+ButtonExtension.h"

@implementation UIButton (ButtonExtension)
- (void)alignImageAndTitleVertically:(CGFloat)padding
{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGFloat totalHeight = imageSize.height + titleSize.height + padding;
    self.imageEdgeInsets = UIEdgeInsetsMake(-(totalHeight - imageSize.height), (self.frame.size.width - imageSize.width) / 2 - 5, 0, 0);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -(self.frame.size.width - titleSize.width) / 2 - 10, -(totalHeight - titleSize.height), 0);
}
@end
