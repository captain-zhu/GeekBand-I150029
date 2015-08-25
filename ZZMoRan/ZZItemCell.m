//
//  ZZItemCell.m
//  ZZMoRan
//
//  Created by zhu yongxuan on 15/8/23.
//  Copyright (c) 2015年 GeekBand-I150029. All rights reserved.
//

#import "ZZItemCell.h"
#import "ZZCellVariables.h"

@implementation ZZItemCell

- (NSString *)reuseIdentifier {
    return @"ItemCell";
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {

    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {

        //设置照片imageView
        [self initImageView];

        //设置照片描述的Label
        [self initNameLabel];

        // 因为之前tabelview转过一次，这次反方向转回去
        self.transform = CGAffineTransformMakeRotation(M_PI * 0.5);

    }

    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

//初始化imageView，用于显示用户照片
- (void)initImageView
{
    self.photoImageView = [[UIImageView alloc] initWithFrame:
            CGRectMake(0, ZZPhotoTopPadding, ZZPhotoWidth, ZZPhotoHeight)];
    self.photoImageView.opaque = YES;
    [self.contentView addSubview:self.photoImageView];
}

//初始化Label，用于显示用户评论
- (void)initNameLabel
{
    self.nameLabel = [[UILabel alloc] initWithFrame:
            CGRectMake(0, 114, ZZPhotoWidth - 2 * ZZAddressCellHorizontalPadding, 30)];
    self.nameLabel.opaque = YES;
    self.nameLabel.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:10];
    self.nameLabel.textColor = [UIColor colorWithRed:0.267f green:0.267f blue:0.267f alpha:1];
    self.nameLabel.numberOfLines = 0;
    [self.contentView addSubview:self.nameLabel];

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
