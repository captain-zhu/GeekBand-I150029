//
//  AppDelegate.m
//  ZZMoRanS
//
//  Created by zhu yongxuan on 15/8/29.
//  Copyright (c) 2015年 zhu yongxuan. All rights reserved.
//

#import "AppDelegate.h"
#import "ZZTabBarController.h"
#import "ZZSquareTableViewController.h"
#import "ZZPublishTableViewController.h"
#import "ZZMyTableViewController.h"
#import "UIImage+InitWithColor.h"

NSString * const ManagedObjectContextSaveDidFailNotification = @"ManagedObjectContextSaveDidFailNotification";

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)customizeAppearance
{
    //设置所有navigation bar 的外观
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setFrame:CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.window.bounds), 64.0f)];
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0xee7f41)];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setTitleTextAttributes:
            @{NSFontAttributeName : [UIFont fontWithName:@"STHeitiSC-Medium" size:17],
            NSForegroundColorAttributeName : [UIColor whiteColor]}];

    // 设置所有tar bar 的外观
    [[UITabBar appearance] setTintColor:UIColorFromRGB(0xee7f41)];
    [[UITabBar appearance] setFrame:CGRectMake(0, self.window.bounds.size.height - 49, self.window.bounds.size.width, 49)];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"STHeitiSC-Light" size:10]}
                                             forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"STHeitiSC-Light" size:10]}
                                             forState:UIControlStateHighlighted];
    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, - 5)];
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    CGRect frame = CGRectMake(0, 0, self.window.bounds.size.width, 49);
    UIImage *backGroundImage = [UIImage initWithColor:UIColorFromRGB(0xeeeeee) setFrame:frame];
    [[UITabBar appearance] setBackgroundImage:backGroundImage];

}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self customizeAppearance];

    ZZTabBarController *tabBarController = (ZZTabBarController *)self.window.rootViewController;

    UINavigationController *navigationControllerLeft = (UINavigationController *)tabBarController.viewControllers[0];
    navigationControllerLeft.tabBarItem.selectedImage = [UIImage imageNamed:@"square_selected"];
    ZZSquareTableViewController *squareTableViewController =
            (ZZSquareTableViewController *)navigationControllerLeft.viewControllers[0];
    squareTableViewController.title = @"附近1000米";
    squareTableViewController.managedObjectContext = self.managedObjectContext;
    navigationControllerLeft.tabBarItem.title = @"广场";

    UINavigationController *navigationControllerCenter = (UINavigationController *)tabBarController.viewControllers[1];
    ZZPublishTableViewController *publishTableViewController =
            (ZZPublishTableViewController *)navigationControllerCenter.viewControllers[0];
    publishTableViewController.title = @"发布照片";
    publishTableViewController.managedObjectContext = self.managedObjectContext;
    navigationControllerCenter.tabBarItem.title = @"";

    UINavigationController *navigationControllerRight = (UINavigationController *)tabBarController.viewControllers[2];
    navigationControllerRight.tabBarItem.selectedImage = [UIImage imageNamed:@"my_selected"];
    ZZMyTableViewController *myTableViewController =
            (ZZMyTableViewController *)navigationControllerRight.viewControllers[0];
    myTableViewController.title = @"我的";
    myTableViewController.managedObjectContext = self.managedObjectContext;

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(fatalCoreDataError:)
                                                 name:ManagedObjectContextSaveDidFailNotification
                                               object:nil];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [self saveContext];
}

#pragma mark - Notification Methods

- (void)fatalCoreDataError:(NSNotification *)notification
{
    UIAlertView *alertView = [[UIAlertView alloc]
            initWithTitle:NSLocalizedString(@"内部错误", nil)
                  message:NSLocalizedString(@"应用出现了致命错误。\n\n请按OK键退出应用。实在不好意思，对不起。", nil)
                 delegate:self
        cancelButtonTitle:NSLocalizedString(@"OK", nil)
        otherButtonTitles:nil];

    [alertView show];
}


#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

@end
