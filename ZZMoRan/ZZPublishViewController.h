//
//  ZZPublishViewController.h
//  ZZMoRan
//
//  Created by zhu yongxuan on 15/8/13.
//  Copyright (c) 2015年 GeekBand-I150029. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZPublishViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableViewCell *imageViewCell;
@property (nonatomic, strong) UITableViewCell *reShotCell;
@property (nonatomic, strong) UITableViewCell *pingLunCell;
@property (nonatomic, strong) UITableViewCell *addressCell;

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UITextField *textField;

@end
