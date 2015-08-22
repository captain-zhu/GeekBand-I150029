//
//  ZZTabBarViewController.m
//  ZZMoRan
//
//  Created by zhu yongxuan on 15/8/13.
//  Copyright (c) 2015年 GeekBand-I150029. All rights reserved.
//

#import "ZZTabBarViewController.h"
#import "ZZGuangchangTableViewController.h"
#import "ZZWoDeViewController.h"

@interface ZZTabBarViewController ()

@end

@implementation ZZTabBarViewController

#pragma mark - Application LifeCycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置tabBar字体被选中的颜色
    self.tabBar.tintColor = [UIColor orangeColor];

    // 添加子控制器
    [self addGuangChangNavigationController];
    [self addWoDeNavigationController];

    // 加入发布按钮
    [self addFaBuButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Custom Methods

/**
* 添加“广场”导航控制器及其子控制器
*/
- (void) addGuangChangNavigationController
{
    ZZGuangChangTableViewController *guangChangTableViewController = [[ZZGuangChangTableViewController alloc] init];
    ZZGuangChangNavigationController *guangChangNavigationController = [[ZZGuangChangNavigationController alloc] initWithRootViewController:guangChangTableViewController];
    guangChangNavigationController.tabBarItem.title = @"广场";
    guangChangNavigationController.tabBarItem.image = [UIImage imageNamed:@"square"];
    guangChangNavigationController.tabBarItem.selectedImage = [UIImage imageNamed:@"square_selected"];
    [self addChildViewController:guangChangNavigationController];
}

/**
* 添加“我的”子控制器
*/
- (void) addWoDeNavigationController
{
    ZZWoDeViewController *woDeViewController = [[ZZWoDeViewController alloc] init];
    ZZWoDeNavigationController *woDeNavigationController = [[ZZWoDeNavigationController alloc] initWithRootViewController:woDeViewController];
    woDeNavigationController.tabBarItem.title = @"我的";
    woDeNavigationController.tabBarItem.image = [UIImage imageNamed:@"my"];
    woDeNavigationController.tabBarItem.selectedImage = [UIImage imageNamed:@"my_selected"];
    [self addChildViewController:woDeNavigationController];
}



-(void) addFaBuButton
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    UIImage *buttonImage = [UIImage imageNamed:@"publish"];
    UIImage *highlightImage = [UIImage imageNamed:@"publish_hover"];
    button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    
    CGPoint center = self.tabBar.center;
    center.y = center.y - 22.5;
    button.center = center;
    
    [self.view addSubview:button];
}

@end
