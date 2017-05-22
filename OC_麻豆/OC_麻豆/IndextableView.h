//
//  IndextableView.h
//  OC_麻豆
//
//  Created by JM Zhao on 2017/5/22.
//  Copyright © 2017年 JunMing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^changeContentSize)(CGSize contentSize);

@interface IndextableView : UITableView
@property (nonatomic, copy) changeContentSize changeContentSize;
@end
