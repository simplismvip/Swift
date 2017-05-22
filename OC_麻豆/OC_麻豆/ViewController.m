//
//  ViewController.m
//  OC_麻豆
//
//  Created by JM Zhao on 2017/5/22.
//  Copyright © 2017年 JunMing. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+ButtonExtension.h"
#import "IndextableView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define functionHeaderViewHeight 95
#define singleAppHeaderViewHeight 60

#define topOffsetY 155

@interface ViewController ()<UIScrollViewDelegate, UIGestureRecognizerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // uiscrollView
    CGFloat height = SCREEN_HEIGHT - 64;
    UIScrollView *mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, height)];
    mainScrollView.delegate = self;
    mainScrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 100);
    mainScrollView.scrollIndicatorInsets = UIEdgeInsetsMake(155, 0, 0, 0);
    [self.view addSubview:mainScrollView];
    
    // navView
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    navView.backgroundColor = [UIColor colorWithRed:65/255.0 green:128/255.0 blue:1 alpha:1];
    [self.view addSubview:navView];
    
    // mainNavView
    UIView *mainNavView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    mainNavView.backgroundColor = [UIColor colorWithRed:65/255.0 green:128/255.0 blue:1 alpha:1];
    [self.view addSubview:mainNavView];
    
    UIButton *pa
    
    // uiscrollView
    
    
    // uiscrollView
    
    
    // uiscrollView
    
    
    // uiscrollView
    
    
    // uiscrollView
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
