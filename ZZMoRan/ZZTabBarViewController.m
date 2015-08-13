//
//  ZZTabBarViewController.m
//  ZZMoRan
//
//  Created by zhu yongxuan on 15/8/13.
//  Copyright (c) 2015年 GeekBand-I150029. All rights reserved.
//

#import "ZZTabBarViewController.h"
#import "ZZGuangchangViewController.h"
#import "ZZWoDeViewController.h"

@interface ZZTabBarViewController ()

@end

@implementation ZZTabBarViewController

#pragma mark - Application LifeCycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置tabbar字体被选中的颜色
    self.tabBar.tintColor = [UIColor orangeColor];
    
    // 添加子控制器
    // 广场导航控制器及其子控制器
    ZZGuangchangViewController *guangChangViewController = [[ZZGuangchangViewController alloc] init];
    ZZGuangChangNavigationController *guangChangNavigationController = [[ZZGuangChangNavigationController alloc] initWithRootViewController:guangChangViewController];
    guangChangNavigationController.tabBarItem.title = @"广场";
    guangChangNavigationController.tabBarItem.image = [UIImage imageNamed:@"square"];
    guangChangNavigationController.tabBarItem.selectedImage = [UIImage imageNamed:@"square_selected"];
    [self addChildViewController:guangChangNavigationController];
    
    // 我的子控制器
    ZZWoDeViewController *woDeViewController = [[ZZWoDeViewController alloc] init];
    ZZWoDeNavigationController *woDeNavigationController = [[ZZWoDeNavigationController alloc] initWithRootViewController:woDeViewController];
    woDeNavigationController.tabBarItem.title = @"我的";
    
    woDeNavigationController.tabBarItem.image = [UIImage imageNamed:@"my"];
    woDeNavigationController.tabBarItem.selectedImage = [UIImage imageNamed:@"my_selected"];
    [self addChildViewController:woDeNavigationController];
    
    // 加入发布按钮
    [self addFaBuButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Custom Methods

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
