//
//  ZZHorizontalTableViewCell.h
//  ZZMoRan
//
//  Created by zhu yongxuan on 15/8/23.
//  Copyright (c) 2015年 GeekBand-I150029. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZHorizontalTableViewCell : UITableViewCell <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *horizontalTableView;
@property (nonatomic, strong) NSArray *items;

@end
