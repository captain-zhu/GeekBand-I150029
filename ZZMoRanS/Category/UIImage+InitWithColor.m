//
//  UIImage+InitWithColor.m
//  ZZMoRanS
//
//  Created by zhu yongxuan on 15/8/30.
//  Copyright (c) 2015年 zhu yongxuan. All rights reserved.
//

#import "UIImage+InitWithColor.h"

@implementation UIImage (InitWithColor)

+ (UIImage *)initWithColor:(UIColor *)color setFrame :(CGRect)frame {

    CGRect rect = frame;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

@end
