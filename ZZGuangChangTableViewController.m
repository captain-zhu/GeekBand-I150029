//
//  ZZGuangChangTableViewController.m
//  ZZMoRan
//
//  Created by zhu yongxuan on 15/8/22.
//  Copyright (c) 2015年 GeekBand-I150029. All rights reserved.
//

#import "ZZGuangChangTableViewController.h"
#import "ZZHorizontalTableViewCell.h"
#import "AddressCell.h"

@interface ZZGuangChangTableViewController ()

@end

@implementation ZZGuangChangTableViewController

#pragma mark - Life cycle methods

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initializtion
    }

    return self;
}

- (void)awakeFromNib {
    [self.tableView setBackgroundColor:[UIColor colorWithRed:235.0f/255.0 green:236.0f/255.0f
                                                        blue:236.0f/255.0 alpha:1]];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorColor = [UIColor colorWithRed:213.0f/255.0f
                                                    green:213.0f/255.0f blue:213.0f/255.0f alpha:1];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _dataDictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]
            pathForResource:@"Articles" ofType:@"plist"]];

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

    return [_dataDictionary.allKeys count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == 0) {

        static NSString *CellIdentifier = @"AddressCell";

        AddressCell *cell = (AddressCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];

        if (cell == nil) {
            cell = [[AddressCell alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
        }

        NSArray *addresses = [self.dataDictionary allKeys];
        NSString *address = [addresses objectAtIndex:indexPath.section];

        cell.addressLabel.text = address;
        return cell;

    } else {
        static NSString *CellIdentifier = @"HorizontalCell";
        ZZHorizontalTableViewCell *cell = (ZZHorizontalTableViewCell *)[tableView
                dequeueReusableCellWithIdentifier:CellIdentifier];

        if (cell == nil) {
            cell = [[ZZHorizontalTableViewCell alloc] initWithFrame:
                    CGRectMake(0, 0, tableView.frame.size.width, tableView.frame.size.height)];
        }

        NSArray *array = [self.dataDictionary allKeys];
        NSString *itemName = [array objectAtIndex:indexPath.section];

        cell.items = [self.dataDictionary objectForKey:itemName];

        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 25;
    } else {
        return 150;
    }
}























@end
