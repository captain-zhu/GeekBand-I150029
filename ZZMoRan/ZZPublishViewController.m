//
//  ZZPublishViewController.m
//  ZZMoRan
//
//  Created by zhu yongxuan on 15/8/13.
//  Copyright (c) 2015年 GeekBand-I150029. All rights reserved.
//

#import <Masonry/View+MASShorthandAdditions.h>
#import "ZZPublishViewController.h"
#import "PrefixHeader.pch"

@interface ZZPublishViewController ()

@end

@implementation ZZPublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView {
    [super loadView];

    self.view.backgroundColor = UIColorFromRGB(0xebecec);
    self.title = @"发布照片";

    // creat right bar button
    UIButton *btnRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnRight setFrame:CGRectMake(0, 0, 49, 30)];
    btnRight.backgroundColor = UIColorFromRGBAndAlpha(0xffffff, 0.6);
    btnRight.titleLabel.text = @"发布";
    btnRight.titleLabel.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:12];
    [btnRight addTarget:self action:@selector(saveData) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBtnRight = [[UIBarButtonItem alloc] initWithCustomView:btnRight];
    [barBtnRight setTintColor:[UIColor clearColor]];
    self.navigationItem.rightBarButtonItem = barBtnRight;

    // construct image cell, section 0, row 0
    self.imageViewCell = [[UITableViewCell alloc] init];
    self.imageViewCell.frame = CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, 212);
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
    self.imageViewCell.backgroundView = self.imageView;
    self.imageViewCell.backgroundView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageViewCell.backgroundView.clipsToBounds = YES;

    // construct re shot cell, section 0, row 1
    self.reShotCell = [[UITableViewCell alloc] init];
    UIImageView *rePickImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"publish_repick"]];
    rePickImageView.frame = CGRectMake(self.view.frame.size.width / 2 - 23, 8.5, 16, 16);
    [self.reShotCell addSubview:rePickImageView];
    UILabel *rePickLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2, 10.5,100, 16)];
    rePickLabel.text = @"重新拍摄";
    rePickLabel.textColor = UIColorFromRGB(0x9f9fa0);
    rePickLabel.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:11];
    [rePickLabel sizeToFit];
    [self.reShotCell addSubview:rePickLabel];

    // construct textField cell, section 1, row 0
    self.pingLunCell = [[UITableViewCell alloc] init];
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width, 93)];
    self.textField.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:12.5];
    self.textField.textColor = UIColorFromRGB(0x9f9fa0);
    [self.pingLunCell addSubview:self.textField];

    //construct address cell, section 2, row 0
    self.addressCell = [[UITableViewCell alloc] init];
    self.addressCell.imageView.image = [UIImage imageNamed:@"publish_location"];
    self.addressCell.imageView.frame = CGRectMake(10,15,22,22);
    self.addressCell.textLabel.frame = CGRectMake(37,12,self.view.frame.size.width,30);
    self.addressCell.textLabel.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:12.5];
    self.addressCell.textLabel.textColor = UIColorFromRGB(0x9f9fa0);
    self.addressCell.textLabel.text = @"法国巴菲尔铁塔";
    [self.addressCell.textLabel sizeToFit];
}

#pragma mark - UI Table view controller delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return  2;
        case 1:
            return 1;
        case 2:
            return 1;
        default:
            return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 1:
            return 7;
        case 2:
            return 7;
        default:
            return 0;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {

    view.backgroundColor = [UIColor clearColor];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) return 212;
            else return 33;
        case 1:
            return 93;
        case 2:
            return 37;
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    return self.imageViewCell;
                case 1:
                    return self.reShotCell;
                default:
                    return nil;
            }
        case 1:
            return self.pingLunCell;
        case 2:
            return self.addressCell;
        default:
            return nil;
    }

    return nil;
}



@end
