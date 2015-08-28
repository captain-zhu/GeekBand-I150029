//
//  AppDelegate.h
//  ZZMoRan
//
//  Created by zhu yongxuan on 15/8/13.
//  Copyright (c) 2015年 GeekBand-I150029. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class ZZGuangChangNavigationController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, strong) ZZGuangChangNavigationController *guangChangNavigationController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

