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
        self.photoImageView = [[UIImageView alloc] initWithFrame:
                CGRectMake(0, ZZPhotoTopPadding, ZZPhotoWidth, ZZPhotoHeight)];
        self.photoImageView.opaque = YES;
        [self.contentView addSubview:self.photoImageView];

        //设置照片描述的Label
        self.nameLabel = [[UILabel alloc] initWithFrame:
                CGRectMake(0, 164, ZZPhotoWidth, 27)];
        self.nameLabel.opaque = YES;
        self.nameLabel.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:10];
        [self.contentView addSubview:self.nameLabel];

        self.transform = CGAffineTransformMakeRotation(M_PI * 0.5);

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
