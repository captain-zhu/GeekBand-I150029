//
//  ZZGuangChangTableViewController.m
//  ZZMoRan
//
//  Created by zhu yongxuan on 15/8/22.
//  Copyright (c) 2015年 GeekBand-I150029. All rights reserved.
//

#import "ZZGuangChangTableViewController.h"

@interface ZZGuangChangTableViewController ()

@end

@implementation ZZGuangChangTableViewController

#pragma mark - Life cycle methods

- (void)viewDidLoad {
    [super viewDidLoad];

    [self customNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom methods

/**
* 自定义NavigationBar
*/
- (void)customNavigationBar
{
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    
    navigationBar.frame =  CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.view.bounds), 64.0f);
    navigationBar.barTintColor = [UIColor colorWithRed:238.0f/255.0f green:127.0f/255.0f blue:65.0f/255.0f alpha:1];
    navigationBar.translucent = NO;
    NSDictionary *attributes = @{NSFontAttributeName : [UIFont fontWithName:@"STHeitiSC-Medium" size:17],
                                 NSForegroundColorAttributeName : [UIColor whiteColor]};
    [navigationBar setTitleTextAttributes:attributes];
    
    UINavigationItem *item = navigationBar.topItem;
    item.title = @"附近1000米";
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
