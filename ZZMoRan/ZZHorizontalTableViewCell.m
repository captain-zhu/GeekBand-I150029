//
//  ZZHorizontalTableViewCell.m
//  ZZMoRan
//
//  Created by zhu yongxuan on 15/8/23.
//  Copyright (c) 2015年 GeekBand-I150029. All rights reserved.
//

#import "ZZHorizontalTableViewCell.h"
#import "ZZItemCell.h"
#import "ZZCellVariables.h"

@implementation ZZHorizontalTableViewCell

- (NSString *)reuseIdentifier {
    return @"HorizontalCell";
}

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {

        self.horizontalTableView = [[UITableView alloc] initWithFrame:
                CGRectMake(0, 0, ZZHorizontalCellHeight, frame.size.width)];
        self.horizontalTableView.showsVerticalScrollIndicator = NO;
        self.horizontalTableView.showsHorizontalScrollIndicator = NO;

        // 将我们的view逆时针旋转90度
        self.horizontalTableView.transform = CGAffineTransformMakeRotation(-M_PI * 0.5);

        // 重新设置frame
        [self.horizontalTableView setFrame:
                CGRectMake(ZZHorizontalCellHorizontalPadding, ZZHorizontalCellVerticalPadding
                        , frame.size.width - ZZHorizontalCellHorizontalPadding * 2, ZZHorizontalCellHeight)];

        self.horizontalTableView.rowHeight = ZZItemWidth;
        self.horizontalTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.horizontalTableView.separatorColor = [UIColor clearColor];

        self.horizontalTableView.delegate = self;
        self.horizontalTableView.dataSource = self;
        [self addSubview:self.horizontalTableView];

    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {

    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark  - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"ItmeCell";

    ZZItemCell *itemCell = (ZZItemCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (itemCell == nil) {
        itemCell = [[ZZItemCell alloc] initWithFrame:CGRectMake(
                15, 0, tableView.frame.size.width - 15, 150)];
    }

    NSDictionary *currentItem = [self.items objectAtIndex:indexPath.row];

    itemCell.photoImageView.image = [UIImage imageNamed:[currentItem objectForKey:@"ImageName"]];
    itemCell.nameLabel.text = [currentItem objectForKey:@"Title"];

    return itemCell;

}


















@end
