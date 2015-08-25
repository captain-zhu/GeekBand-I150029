//
//  ZZGuangChangTableViewController.m
//  ZZMoRan
//
//  Created by zhu yongxuan on 15/8/22.
//  Copyright (c) 2015年 GeekBand-I150029. All rights reserved.
//

#import "ZZGuangChangTableViewController.h"
#import "ZZChaKanViewController.h"
#import "ZZHorizontalTableViewCell.h"
#import "AddressCell.h"
#import "ZZCellVariables.h"

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

    // 第一行显示地址信息，初始化AddressCell，并将地址信息传递给AddressCell的Label
    if (indexPath.row == 0) {

        static NSString *CellIdentifier = @"AddressCell";

        AddressCell *cell = (AddressCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];

        if (cell == nil) {
            cell = [[AddressCell alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
        }

        NSArray *addresses = [self.dataDictionary allKeys];
        NSString *address = [addresses objectAtIndex:indexPath.section];

        cell.addressLabel.text = address;
        [cell.addressLabel sizeToFit];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }
    // 第二行显示图片和评论，初始化HorizontalTableViewCell,并传递一个包含图片和评论信息的数组
    else {
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
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

// 第一行高度为25， 第二行高度为150
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == 0) {
        return 25;
    } else {
        return 150;
    }
}

// 为每个section初始化一个标题栏，但是没有内容，用以伪造section直接的空隙
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return ZZSectionTopPadding;
}

// 设置伪造标题栏的背景并设置分割线
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    UIView *view1 = [UIView new];
    [view1 setBackgroundColor:[UIColor colorWithRed:235.0f/255.0f
                                              green:236.0f/255.0f blue:236.0f/255.0f alpha:1]];

    // 自定义一个分割线
    UIView *additionalSeparater = [[UIView alloc] initWithFrame:
            CGRectMake(0, view1.frame.size.height - 0.5, view1.frame.size.width, 0.5)];
    additionalSeparater.backgroundColor = [UIColor colorWithRed:213.0f/255.0f
                                                          green:213.0f/255.0f
                                                           blue:213.0f/255.0f
                                                          alpha:1];
    [view1 addSubview:additionalSeparater];
    return view1;

}

// 设置每个单元间的分割线离两边长度为0,高度为1
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

    // 设置系统的分割线隐藏
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 自定义一个分割线
    UIView *additionalSeparater = [[UIView alloc] initWithFrame:
                                   CGRectMake(0, cell.frame.size.height - 0.5, cell.frame.size.width, 0.5)];
    additionalSeparater.backgroundColor = [UIColor colorWithRed:213.0f/255.0f
                                                          green:213.0f/255.0f
                                                           blue:213.0f/255.0f
                                                          alpha:1];
    [cell addSubview:additionalSeparater];

}






















@end
