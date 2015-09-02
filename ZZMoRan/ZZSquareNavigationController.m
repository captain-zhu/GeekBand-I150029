//
//  ZZSquareNavigationController.m
//  ZZMoRan
//
//  Created by zhu yongxuan on 15/8/13.
//  Copyright (c) 2015年 GeekBand-I150029. All rights reserved.
//

#import "ZZSquareNavigationController.h"
#import "ZZSquareTableViewController.h"
#import "ZZDetalViewController.h"
#import "ZZTabBarViewController.h"
#import "PrefixHeader.pch"

@interface ZZSquareNavigationController ()

@end

@implementation ZZSquareNavigationController

#pragma mark - Life cycle methods

- (void)viewDidLoad {
    [super viewDidLoad];

    self.delegate = self;

}

-(void)dealloc {
    self.delegate = nil;
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

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]
            initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
}

@end
