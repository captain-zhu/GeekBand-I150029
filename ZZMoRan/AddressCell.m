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
        self.locationImageView = [[UIImageView alloc] initWithFrame:
                                  CGRectMake(ZZAddressCellHorizontalPadding, ZZAddressCellVerticalPadding,
                                          ZZAddressCellWidth, ZZAddressCellHeight)];
        self.locationImageView.image = [UIImage imageNamed:@"location"];
        [self.contentView addSubview:self.locationImageView];
        
        // 设置地址Label
        self.addressLabel = [[UILabel alloc] init];
        CGFloat textWidth= [self.addressLabel.text sizeWithFont:[UIFont fontWithName:@"STHeitiSC-Medium" size:10]].width;
        CGRectMake(ZZAddressCellHorizontalPadding + ZZAddressCellWidth + ZZAddressCellHorizontalPadding,
                ZZAddressCellVerticalPadding, textWidth, ZZAddressCellHeight);
        self.addressLabel.textColor = [UIColor colorWithRed:159.0f/255.0f green:159.0f/255.0f blue:160.0f/255.0f alpha:1];
        self.addressLabel.numberOfLines = 1;
        [self.contentView addSubview:self.addressLabel];

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

@end
