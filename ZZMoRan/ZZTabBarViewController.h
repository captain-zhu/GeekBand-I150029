//
//  ZZTabBarViewController.h
//  ZZMoRan
//
//  Created by zhu yongxuan on 15/8/13.
//  Copyright (c) 2015年 GeekBand-I150029. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZZGuangChangNavigationController.h"
#import "ZZWoDeNavigationController.h"

@interface ZZTabBarViewController : UITabBarController

@property (nonatomic, strong)ZZGuangChangNavigationController *guangChangNavigationController;
@property (nonatomic, strong)UIButton *faBuButton;

@end
