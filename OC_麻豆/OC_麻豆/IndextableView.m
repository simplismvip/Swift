//
//  IndextableView.m
//  OC_麻豆
//
//  Created by JM Zhao on 2017/5/22.
//  Copyright © 2017年 JunMing. All rights reserved.
//

#import "IndextableView.h"
#import "MJRefresh.h"


@interface IndextableView ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, assign) NSInteger numberRows;
@end

@implementation IndextableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if ([super initWithFrame:frame style:style]) {
        
        self.delegate = self;
        self.dataSource = self;
        self.rowHeight = (1000 - 140) / 20;
        self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    
    return self;
}

- (void)loadeMoreData
{
    self.numberRows += 10;
    [self reloadData];
    
    if (self.changeContentSize) {
        
        self.changeContentSize(self.contentSize);
    }
}

- (void)setScrollViewContentOffSet:(CGPoint)point
{
    self.contentOffset = point;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld -- reusablecell", indexPath.row];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
        cell.textLabel.text = [NSString stringWithFormat:@"%ld -- reusablecell", indexPath.row];
    }
    
    return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
