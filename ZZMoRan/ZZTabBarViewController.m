//
//  ZZTabBarViewController.m
//  ZZMoRan
//
//  Created by zhu yongxuan on 15/8/13.
//  Copyright (c) 2015年 GeekBand-I150029. All rights reserved.
//

#import "ZZTabBarViewController.h"
#import "ZZSquareTableViewController.h"
#import "ZZMyViewController.h"
#import "ZZPublishViewController.h"
#import "AppDelegate.h"

@interface ZZTabBarViewController ()

@end

@implementation ZZTabBarViewController

#pragma mark - Application LifeCycle methods

- (void)viewDidLoad {
    [super viewDidLoad];

    // 添加子控制器
    [self addSquareNavigationController];
//    [self addPublishNavigationController];
    [self addMyNavigationController];

    // 加入发布按钮
    [self addCenterButtonWithTarget:self action:@selector(buttonPressd:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Methods

/**
* 添加“广场”导航控制器及其子控制器
*/
- (void)addSquareNavigationController
{
    ZZSquareTableViewController *squareTableViewController = [[ZZSquareTableViewController alloc] init];
    ZZSquareNavigationController *squareNavigationController = [[ZZSquareNavigationController alloc]
            initWithRootViewController:squareTableViewController];
    squareNavigationController.tabBarItem.title = @"广场";
    squareNavigationController.tabBarItem.image = [UIImage imageNamed:@"square"];
    squareNavigationController.tabBarItem.selectedImage = [UIImage imageNamed:@"square_selected"];
    [self addChildViewController:squareNavigationController];
    self.squareNavigationController = squareNavigationController;
}

///**
//* 添加“发布”子控制器
//*/
//- (void)addPublishNavigationController
//{
//    ZZPublishViewController *publishViewController = [[ZZPublishViewController alloc] init];
//    publishViewController.title = @"发布照片";
//    publishViewController.tabBarItem.title = @"";
//    publishViewController.tabBarItem.enabled = NO;
//    [self addChildViewController:publishViewController];
//}

/**
* 添加“我的”子控制器
*/
- (void)addMyNavigationController
{
    ZZMyViewController *myViewController = [[ZZMyViewController alloc] init];
    self.myNavigationController = [[ZZMyNavigationController alloc] initWithRootViewController:myViewController];
    self.myNavigationController.tabBarItem.title = @"我的";
    self.myNavigationController.tabBarItem.image = [UIImage imageNamed:@"my"];
    self.myNavigationController.tabBarItem.selectedImage = [UIImage imageNamed:@"my_selected"];
    [self addChildViewController:self.myNavigationController];
}


-(void)addCenterButtonWithTarget:(id)target action:(SEL)action
{
    UIButton *centerButton = [[UIButton alloc] init];
    centerButton.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    UIImage *buttonImage = [UIImage imageNamed:@"publish"];
    UIImage *highlightImage = [UIImage imageNamed:@"publish_hover"];
    centerButton.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [centerButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [centerButton setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    [centerButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];


    CGPoint center = self.tabBar.center;
    center.y -= 22.5;
    centerButton.center = center;
    [self.view addSubview:centerButton];

    self.centerButton = centerButton;
}

- (void)buttonPressd:(id)sender {

    self.centerButton.highlighted = YES;
    self.centerButton.highlighted = NO;

    NSLog(@"Button has been pressd.");

    ZZPublishViewController *publishViewController = [[ZZPublishViewController alloc] init];
    publishViewController.title = @"发布照片";

    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    if (self.selectedIndex == 0) {
        appDelegate.squareNavigationController.delegate = self;
        [appDelegate.squareNavigationController pushViewController:publishViewController animated:YES];
    }
    if (self.selectedIndex == 1) {
        appDelegate.myNavigationController.delegate = self;
        [appDelegate.myNavigationController pushViewController:publishViewController animated:YES];
    }

}

- (void)viewDidLayoutSubviews{
    self.centerButton.layer.zPosition = 1;
}

#pragma mark - UINavigationController Delegate

- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (viewController.hidesBottomBarWhenPushed) {
//        CGRect rect= [self.centerButton convertRect:self.centerButton.bounds toView:self.tabBar];
        [self.centerButton removeFromSuperview];
        [self.tabBar addSubview:self.centerButton];
//        self.centerButton.frame=rect;
    }
}

-(void)navigationController:(nonnull UINavigationController *)navigationController
      didShowViewController:(nonnull UIViewController *)viewController animated:(BOOL)animated{
    if(!viewController.hidesBottomBarWhenPushed){
//        CGRect rect= [self.centerButton convertRect:self.centerButton.bounds toView:self.view];
        [self.centerButton removeFromSuperview];
        [self.view addSubview:self.centerButton];
//        self.centerButton.frame=rect;
    }
}


@end
