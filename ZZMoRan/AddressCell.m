//
//  AddressCell.m
//  ZZMoRan
//
//  Created by zhu yongxuan on 15/8/23.
//  Copyright (c) 2015年 GeekBand-I150029. All rights reserved.
//


#import "AddressCell.h"
#import "ZZCellVariables.h"

@implementation AddressCell

// 确定单元的Identifier
- (NSString *)reuseIdentifier {
    return @"AddressCell";
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIndentifier:(NSString *)reuseIdentifier
{
    self = [self initWithStyle:style reuseIndentifier:reuseIdentifier];
    if (self) {
        
    }
    
    return self;
}


- (id) initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {

        // 设置定位图标
        [self initImageView];
        
        // 设置地址Label
        [self initAddressLabel];
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

// 初始化imageView
- (void)initImageView
{
    
    self.locationImageView = [[UIImageView alloc] initWithFrame:
                              CGRectMake(0, ZZAddressCellVerticalPadding,
                                         ZZAddressCellWidth, ZZAddressCellHeight)];
    self.locationImageView.image = [UIImage imageNamed:@"location"];
    [self.contentView addSubview:self.locationImageView];
}

// 初始化AddressLabel
- (void)initAddressLabel
{
    self.addressLabel = [[UILabel alloc] init];
    self.addressLabel.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:12];
    CGRect frame = CGRectMake(ZZAddressCellWidth, ZZAddressCellVerticalPadding, self.contentView.frame.size.width, ZZAddressCellHeight);
    self.addressLabel.frame = frame;
    self.addressLabel.textColor = [UIColor colorWithRed:159.0f/255.0f green:159.0f/255.0f blue:160.0f/255.0f alpha:1];
    self.addressLabel.numberOfLines = 1;
    [self.contentView addSubview:self.addressLabel];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// 重载setFrame函数，设单元两侧留有空隙
- (void)setFrame:(CGRect)frame {
    frame.origin.x += ZZHorizontalCellHorizontalPadding;
    frame.size.width -= 2 * ZZHorizontalCellHorizontalPadding;
    [super setFrame:frame];
}

@end
