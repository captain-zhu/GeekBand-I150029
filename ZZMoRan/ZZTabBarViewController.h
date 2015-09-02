//
//  ZZTabBarViewController.h
//  ZZMoRan
//
//  Created by zhu yongxuan on 15/8/13.
//  Copyright (c) 2015年 GeekBand-I150029. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZZSquareNavigationController.h"
#import "ZZMyNavigationController.h"

@interface ZZTabBarViewController : UITabBarController <UINavigationControllerDelegate>

@property (nonatomic, strong) ZZSquareNavigationController *squareNavigationController;
@property (nonatomic, strong) ZZMyNavigationController *myNavigationController;
@property (nonatomic, strong) UIButton *centerButton;

@end
