//
//  ZZGuangChangNavigationController.m
//  ZZMoRan
//
//  Created by zhu yongxuan on 15/8/13.
//  Copyright (c) 2015年 GeekBand-I150029. All rights reserved.
//

#import "ZZGuangChangNavigationController.h"
#import "ZZGuangChangTableViewController.h"
#import "ZZChaKanViewController.h"
#import "ZZTabBarViewController.h"
#import "PrefixHeader.pch"

@interface ZZGuangChangNavigationController ()

@end

@implementation ZZGuangChangNavigationController

#pragma mark - Life cycle methods

- (void)viewDidLoad {
    [super viewDidLoad];

    self.delegate = self;

    [self styleNavigationBar];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom methods

/**
* 重写push方法，使不是根控制器点击push时隐藏TabBar
*/
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        // 注意这里不是self，是push出来的VC隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    // 最后一定要调用父类方法
    [super pushViewController:viewController animated:animated];
}

/**
* 自定义NavigationBar
*/
- (void)styleNavigationBar
{
    UINavigationBar *navigationBar = self.navigationBar;

    navigationBar.frame =  CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.view.bounds), 64.0f);
    navigationBar.barTintColor = UIColorFromRGB(0xee7f41);
    navigationBar.tintColor = [UIColor whiteColor];
    navigationBar.translucent = NO;
    NSDictionary *attributes = @{NSFontAttributeName : [UIFont fontWithName:@"STHeitiSC-Medium" size:17],
            NSForegroundColorAttributeName : [UIColor whiteColor]};
    [navigationBar setTitleTextAttributes:attributes];
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]
            initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
}

@end
