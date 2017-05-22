//
//  SearchbarView.m
//  MaDou
//
//  Created by JM Zhao on 2017/5/22.
//  Copyright © 2017年 JunMing. All rights reserved.
//

#import "SearchbarView.h"
#import "UIView+Extension.h"

@interface SearchbarView ()
@property (nonatomic, weak) UIButton *btn1;
@property (nonatomic, weak) UIButton *btn2;
@property (nonatomic, weak) UIButton *btn3;
@property (nonatomic, weak) UIButton *btn4;
@end

@implementation SearchbarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        CGFloat margin = 10.0;
        CGFloat height = (self.height-5*margin)/4;
        
        for (int i = 0; i < 4; i ++) {
            
            UIButton *btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
            btn.backgroundColor = [UIColor greenColor];
            [btn addTarget:self action:@selector(searchBtn:) forControlEvents:(UIControlEventTouchUpInside)];
            [btn setTitle:[NSString stringWithFormat:@"search_%d", i] forState:(UIControlStateNormal)];
            [self addSubview:btn];
            btn.frame = CGRectMake(0, margin+(margin + height)*i, self.width, height);
        }
    }
    return self;
}

- (void)searchBtn:(UIButton *)sender
{
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
