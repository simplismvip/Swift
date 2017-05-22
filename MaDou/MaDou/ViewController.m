//
//  ViewController.m
//  MaDou
//
//  Created by JM Zhao on 2017/5/22.
//  Copyright © 2017年 JunMing. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationBar+Awesome.h"
#import "SearchbarView.h"
#import "UIView+Extension.h"

#define NAVBAR_CHANGE_POINT 50

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    SearchbarView *search = [[SearchbarView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 300)];
    search.backgroundColor = [UIColor redColor];
    self.tableView.tableHeaderView = search;
    
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    
    // 将leftItem设置为自定义按钮
    UIBarButtonItem *leftItem =[[UIBarButtonItem alloc] initWithTitle:@"Done" style:(UIBarButtonItemStyleDone) target:self action:@selector(leftItem:)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem =[[UIBarButtonItem alloc] initWithTitle:@"+" style:(UIBarButtonItemStyleDone) target:self action:@selector(collectionAction:)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIColor * color = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY > NAVBAR_CHANGE_POINT) {
        
        CGFloat alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64));
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
        
    } else {
        
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
    }
    
    CGRect rect = self.tableView.tableHeaderView.frame;
    rect.size.height = 300 - offsetY;
    rect.origin.y = 64;
    
    self.tableView.tableHeaderView.frame = rect;
    NSLog(@"%.2f", offsetY);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.tableView.delegate = self;
    [self scrollViewDidScroll:self.tableView];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tableView.delegate = nil;
    [self.navigationController.navigationBar lt_reset];
}

/*
 - (void)scrollViewDidScroll:(UIScrollView *)scrollView
 {
 CGFloat offsetY = scrollView.contentOffset.y;
 if (offsetY > 0) {
 if (offsetY >= 44) {
 [self setNavigationBarTransformProgress:1];
 } else {
 [self setNavigationBarTransformProgress:(offsetY / 44)];
 }
 } else {
 [self setNavigationBarTransformProgress:0];
 self.navigationController.navigationBar.backIndicatorImage = [UIImage new];
 }
 }
 
 - (void)setNavigationBarTransformProgress:(CGFloat)progress
 {
 [self.navigationController.navigationBar lt_setTranslationY:(-44 * progress)];
 [self.navigationController.navigationBar lt_setElementsAlpha:(1-progress)];
 }
 
 - (void)viewWillAppear:(BOOL)animated
 {
 [super viewWillAppear:YES];
 }
 
 - (void)viewWillDisappear:(BOOL)animated
 {
 [super viewWillDisappear:animated];
 [self.navigationController.navigationBar lt_reset];
 }
 */

#pragma mark UITableViewDatasource
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"header";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = @"text";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

- (void)leftItem:(UIBarButtonItem *)sender
{
    
}

- (void)collectionAction:(UIBarButtonItem *)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
