//
//  ZZMyViewController.m
//  ZZMoRan
//
//  Created by zhu yongxuan on 15/8/13.
//  Copyright (c) 2015年 GeekBand-I150029. All rights reserved.
//

#import <Masonry/View+MASShorthandAdditions.h>
#import "ZZMyViewController.h"
#import "PrefixHeader.pch"

@interface ZZMyViewController ()

@end

@implementation ZZMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView {
    [super loadView];

    self.view.backgroundColor = UIColorFromRGB(0xebecec);
    self.title = @"我的";

    // construct image cell, section 0, row 0
    self.imageCell = [[UITableViewCell alloc] init];
    self.imageCell.frame = CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, 128);
    self.imageCell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
    self.imageCell.backgroundView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageCell.backgroundView.clipsToBounds = YES;

    // image cell add tou xiang image
    self.touXiangImageView = [[UIImageView alloc] initWithFrame:
    CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 24, 21, 48, 48)];
    self.touXiangImageView.layer.cornerRadius = 24;
    self.touXiangImageView.layer.masksToBounds = YES;
    self.touXiangImageView.layer.shouldRasterize = YES;
    self.touXiangImageView.image = [UIImage imageNamed:@"ColdWater.png"];
    [self.imageCell addSubview:self.touXiangImageView];

    // image cell add name label
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:15];
    self.nameLabel.textColor = [UIColor whiteColor];
    self.nameLabel.numberOfLines = 1;
    self.nameLabel.text = @"一个人类";
    CGSize size = [self.nameLabel.text sizeWithAttributes:
            @{NSFontAttributeName:[UIFont fontWithName:@"STHeitiSC-Medium" size:15]}];
    self.nameLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - size.width / 2,
            81, size.width, size.height);
    [self.imageCell addSubview:self.nameLabel];

    // image cell, add email label
    self.emailLabel = [[UILabel alloc] init];
    self.emailLabel.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:8];
    self.emailLabel.textColor = [UIColor whiteColor];
    self.emailLabel.numberOfLines = 1;
    self.emailLabel.text = @"zzMoRan@foxmail.com";
    CGSize size1 = [self.emailLabel.text sizeWithAttributes:
             @{NSFontAttributeName:[UIFont fontWithName:@"STHeitiSC-Medium" size:8]}];
    self.emailLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - size1.width / 2,
            102, size1.width, size1.height);
    [self.imageCell addSubview:self.emailLabel];

    // construct change name cell, section 1, row 0
    self.changeNameCell = [[UITableViewCell alloc] init];
    self.changeNameCell.imageView.image = [UIImage imageNamed:@"nickname.png"];
    self.changeNameCell.imageView.frame = CGRectMake(9, 15, 22, 22);
    self.changeNameCell.textLabel.text = @"更改昵称";
    self.changeNameCell.textLabel.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:12];
    self.changeNameCell.textLabel.textColor = UIColorFromRGB(0x444444);
    self.changeNameCell.textLabel.frame = CGRectMake(47, 28, 0, 0);
    [self.changeNameCell.textLabel sizeToFit];

    // construct head image cell, section 1, row 1
    self.headImageCell = [[UITableViewCell alloc] init];
    self.headImageCell.imageView.image = [UIImage imageNamed:@"headimage.png"];
    self.headImageCell.imageView.frame = CGRectMake(9, 15, 22, 22);
    self.headImageCell.textLabel.text = @"设置头像";
    self.headImageCell.textLabel.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:12];
    self.headImageCell.textLabel.textColor = UIColorFromRGB(0x444444);
    self.headImageCell.textLabel.frame = CGRectMake(47, 28, 0, 0);
    [self.headImageCell.textLabel sizeToFit];

    //construct sign out cell, section 1, row 2
    self.signOutCell = [[UITableViewCell alloc] init];
    self.signOutCell.imageView.image = [UIImage imageNamed:@"signout.png"];
    self.signOutCell.imageView.frame = CGRectMake(9, 15, 22, 22);
    self.signOutCell.textLabel.text = @"注销登入";
    self.signOutCell.textLabel.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:12];
    self.signOutCell.textLabel.textColor = UIColorFromRGB(0x444444);
    self.signOutCell.textLabel.frame = CGRectMake(47, 28, 0, 0);
    [self.signOutCell.textLabel sizeToFit];

    // construct rate cell, section 2, row 0
    self.rateCell = [[UITableViewCell alloc] init];
    self.rateCell.imageView.image = [UIImage imageNamed:@"rate.png"];
    self.rateCell.imageView.frame = CGRectMake(9, 15, 22, 22);
    self.rateCell.textLabel.text = @"评价我们";
    self.rateCell.textLabel.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:12];
    self.rateCell.textLabel.textColor = UIColorFromRGB(0x444444);
    self.rateCell.textLabel.frame = CGRectMake(47, 28, 0, 0);
    [self.rateCell.textLabel sizeToFit];

    // construct follow us cell, section 2, row 1
    self.followUsCell = [[UITableViewCell alloc] init];
    self.followUsCell.imageView.image = [UIImage imageNamed:@"follow.png"];
    self.followUsCell.imageView.frame = CGRectMake(9, 15, 22, 22);
    self.followUsCell.textLabel.text = @"关注我们";
    self.followUsCell.textLabel.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:12];
    self.followUsCell.textLabel.textColor = UIColorFromRGB(0x444444);
    self.followUsCell.textLabel.frame = CGRectMake(47, 28, 0, 0);
    [self.followUsCell.textLabel sizeToFit];

    // construct homepage cell , section 2, row 2
    self.homePageCell = [[UITableViewCell alloc] init];
    self.homePageCell.imageView.image = [UIImage imageNamed:@"homepage.png"];
    self.homePageCell.imageView.frame = CGRectMake(9, 15, 22, 22);
    self.homePageCell.textLabel.text = @"官方网站";
    self.homePageCell.textLabel.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:12];
    self.homePageCell.textLabel.textColor = UIColorFromRGB(0x444444);
    self.homePageCell.textLabel.frame = CGRectMake(47, 28, 0, 0);
    [self.homePageCell.textLabel sizeToFit];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    switch (section) {
        case 0:
            return  1;
        case 1:
            return 3;
        case 2:
            return 3;
        default:
            return 0;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    switch (section) {
        case 1:
            return 13;
        case 2:
            return 10;
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
            return 128;
        case 1:
            return 40;
        case 2:
            return 40;
        default:
            return 0;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    switch (indexPath.section) {
        case 0:
            return self.imageCell;
        case 1:
            switch (indexPath.row) {
                case 0:
                    return self.changeNameCell;
                case 1:
                    return self.headImageCell;
                case 2:
                    return self.signOutCell;
                default:
                    return nil;
            }
        case 2:
            switch (indexPath.row) {
                case 0:
                    return self.rateCell;
                case 1:
                    return self.followUsCell;
                case 2:
                    return self.homePageCell;
                default:
                    return nil;
            }
        default:
            return nil;
    }

    return nil;

}





@end
