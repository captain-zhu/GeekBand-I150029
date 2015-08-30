//
//  ZZTabBarController.m
//  ZZMoRanS
//
//  Created by zhu yongxuan on 15/8/29.
//  Copyright (c) 2015年 zhu yongxuan. All rights reserved.
//

#import "ZZTabBarController.h"

@interface ZZTabBarController ()

@end

@implementation ZZTabBarController

#pragma mark - LifeCycleMethods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {

    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addCenterButtonWithTarget:self action:@selector(buttonPressd:)];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CustomizedMethods

//创建一个button,并将其加到center tab bar 中
- (void)addCenterButtonWithTarget:(id)target action:(SEL)action {


    UIButton *button = [[UIButton alloc] init];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin
            | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    UIImage *buttonImage = [UIImage imageNamed:@"publish"];
    UIImage *highlightImage = [UIImage imageNamed:@"publish_hover"];
    button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    CGPoint center = self.tabBar.center;
    center.y = 0;
    button.center = center;

    [self.tabBar addSubview:button];
    self.centerButton = button;

}

- (void)buttonPressd:(id)sender {

    [self setSelectedIndex:1];
    [self performSelector:@selector(doHighlight:) withObject:sender afterDelay:0];

}

- (void)doHighlight:(UIButton *)button {

    [button setHighlighted:YES];

}

- (void)doNotHighlight:(UIButton *)button {

    [button setHighlighted:NO];

}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {

    if (self.tabBarController.selectedIndex != 1) {

        [self performSelector:@selector(doNotHighlight:) withObject:self.centerButton afterDelay:0];

    }

}

//- (BOOL)tabBarHidden {
//    return self.centerButton.hidden && self.tabBar.hidden;
//}
//
//- (void)setTabBarHidden:(BOOL)tabBarHidden
//{
//
//    self.centerButton.hidden = tabBarHidden;
//    self.tabBar.hidden = tabBarHidden;
//
//}

@end
