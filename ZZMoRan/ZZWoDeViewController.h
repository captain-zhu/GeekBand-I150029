//
//  ZZWoDeViewController.h
//  ZZMoRan
//
//  Created by zhu yongxuan on 15/8/13.
//  Copyright (c) 2015年 GeekBand-I150029. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZWoDeViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableViewCell *imageCell;
@property (strong, nonatomic) UITableViewCell *changeNameCell;
@property (strong, nonatomic) UITableViewCell *headImageCell;
@property (nonatomic, strong) UITableViewCell *signOutCell;
@property (nonatomic, strong) UITableViewCell *rateCell;
@property (nonatomic, strong) UITableViewCell *followUsCell;
@property (nonatomic, strong) UITableViewCell *homePageCell;

@property (nonatomic, strong) UIImageView *touXiangImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *emailLabel;

@end
