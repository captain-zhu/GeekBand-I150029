//  ZZChaKanViewController.m
//  ZZMoRan
//
//  Created by zhu yongxuan on 15/8/13.
//  Copyright (c) 2015年 GeekBand-I150029. All rights reserved.
//

#import <Masonry/View+MASShorthandAdditions.h>
#import "ZZChaKanViewController.h"
#import "ChaKanVariables.h"
#import "PrefixHeader.pch"

@interface ZZChaKanViewController ()

@end

@implementation ZZChaKanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)init {
    
    if ((self = [super init])){
        self.view.backgroundColor = UIColorFromRGB(0xebecec);
        self.navigationItem.title =@"查看照片";
        [self initPhotoImageView];
        [self initInformationView];
        [self addPingLunLabel];
        [self addAddressLabel];
        [self addTouXiangImageView];
        [self addNameLabel];
        [self addTimeLabel];
    }
    
    return self;
    
}



//自定义imageView，宽度和屏幕宽度相同，等比缩放
- (void)initPhotoImageView
{
    self.photoImageView = [[UIImageView alloc] initWithFrame:
                           CGRectMake(0, 0, self.view.frame.size.width, 212)];
    self.photoImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.photoImageView.opaque = YES;
    self.photoImageView.clipsToBounds = YES;
    
    [self.view addSubview:self.photoImageView];
}

- (void)initInformationView
{
    self.informationView = [[UIView alloc] initWithFrame:
                            CGRectMake(0, 0, self.view.frame.size.width, ZZInformationViewHeight)];
    self.informationView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.informationView];
    
    [self.informationView mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.top.equalTo(self.photoImageView.mas_bottom);
        maker.width.equalTo(self.view.mas_width);
        maker.height.mas_equalTo(ZZInformationViewHeight);
    }];
    
}

- (void)addPingLunLabel
{
    self.pingLunLabel = [[UILabel alloc] init];
    
    self.pingLunLabel.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:16];
    self.pingLunLabel.textColor = UIColorFromRGB(0x444444);
    
    [self.informationView addSubview:self.pingLunLabel];
    
    [self.pingLunLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.informationView.mas_top).with.offset(10);
        make.left.equalTo(self.informationView.mas_left).with.offset(13);
    }];
    [self.pingLunLabel sizeToFit];
    self.pingLunLabel.numberOfLines = 0;
}
    
- (void)addAddressLabel
{
    //随便初始化小拍照按钮以及拍摄于Label，因为这个不需要输入，就不定为属性了
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"camera"]];
    imageView.frame = CGRectMake(13, 36, 16, 16);
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.informationView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pingLunLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self.informationView.mas_left).with.offset(13);
    }];
        
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:10];
    label.text = @"拍摄于";
    label.textColor = UIColorFromRGB(0x9f9fa0);
    [label sizeToFit];
    [self.informationView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView.mas_right).with.offset(6);
        make.centerY.equalTo(imageView.mas_centerY);
    }];
        
    self.addressLabel = [[UILabel alloc] init];
    self.addressLabel.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:10];
    self.addressLabel.textColor = UIColorFromRGB(0x9f9fa0);
    self.addressLabel.text = @"上海浦东新区长泰广场";
    self.addressLabel.numberOfLines = 0;
    [self.addressLabel sizeToFit];
    [self.informationView addSubview:self.addressLabel];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label.mas_right).with.offset(3);
        make.centerY.equalTo(label.mas_centerY);
    }];
        
}
    
- (void)addTouXiangImageView
{
    self.touXiangImageView = [[UIImageView alloc] initWithFrame:
                                CGRectMake(13, 57, 30, 30)];
    self.touXiangImageView.layer.masksToBounds = FALSE;
    self.touXiangImageView.layer.shouldRasterize = YES;
    self.touXiangImageView.layer.cornerRadius = self.touXiangImageView.frame.size.width * 0.5f;
    self.touXiangImageView.opaque = YES;
    self.touXiangImageView.image = [UIImage imageNamed:@"football.jpg"];
    self.touXiangImageView.clipsToBounds = YES;
    self.touXiangImageView.contentMode = UIViewContentModeScaleAspectFill;
        
    [self.informationView addSubview:self.touXiangImageView];
        
}
    
- (void)addNameLabel
{
    self.nameLabel = [[UILabel alloc] initWithFrame:
                        CGRectMake(52, 57, 0, 0)];
    self.nameLabel.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:13];
    self.nameLabel.textColor = UIColorFromRGB(0xee7f41);
    self.nameLabel.text = @"一个人类";
    self.nameLabel.numberOfLines = 0;
    [self.nameLabel sizeToFit];
    [self.informationView addSubview:self.nameLabel];
}
    
- (void)addTimeLabel
{
    self.timeLabel = [[UILabel alloc] initWithFrame:
                        CGRectMake(52, 75, 0, 0)];
    self.timeLabel.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:9];
    self.timeLabel.textColor = UIColorFromRGB(0x9f9fa0);
    self.timeLabel.text = @"07月30日 15:22";
    self.timeLabel.numberOfLines = 0;
    [self.timeLabel sizeToFit];
    [self.informationView addSubview:self.timeLabel];
}
    
    
    
    
@end