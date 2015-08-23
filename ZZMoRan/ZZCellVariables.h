//
//  ZZCellVariables.h
//  ZZMoRan
//
//  Created by zhu yongxuan on 15/8/23.
//  Copyright (c) 2015年 GeekBand-I150029. All rights reserved.
//

#ifndef ZZMoRan_ZZCellVariables_h
#define ZZMoRan_ZZCellVariables_h

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// iPhone CONSTANTS
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define ZZAddressCellHorizontalPadding               6
#define ZZAddressCellVerticalPadding                7.5
#define ZZAddressCellHeight                         12
#define ZZAddressCellWidth                          12
#define ZZSectionVerticalPadding                     7
#define ZZHorizontalCellHeight                      150
#define ZZHorizontalCellHorizontalPadding           15
#define ZZHorizontalCellVerticalPadding             10
#define ZZItemHeight                                150
#define ZZItemWidth                                 140
#define ZZPhotoTopPadding                           10
#define ZZPhotoBottomPadding                        90
#define ZZPhotoWidth                                140
#define ZZPhotoHeight                               95
#define kCellThumbnailHeight                        60
#define kCellThumbnailWidth                         60
#define kCellLabelHeight                            25

// Width (or length before rotation) of the table view embedded within another table view's row
#define kTableLength                                320

// Width of the cells of the embedded table view (after rotation, which means it controls the rowHeight property)
#define kCellWidth                                  kCellThumbnailWidth + kArticleCellHorizontalInnerPadding * 3
#define kCellHeight                                 kCellThumbnailHeight + kCellLabelHeight + (kArticleCellVerticalInnerPadding * 3)

// Padding for the Cell containing the article image and title
#define kArticleCellVerticalInnerPadding            4
#define kArticleCellHorizontalInnerPadding          4

// Padding for the title label in an article's cell
#define kArticleTitleLabelPadding                   4

// Vertical padding for the embedded table view within the row
#define kRowVerticalPadding                         0
// Horizontal padding for the embedded table view within the row
#define kRowHorizontalPadding                       0

// The background color of the vertical table view
#define kVerticalTableBackgroundColor               [UIColor colorWithRed:0.58823529 green:0.58823529 blue:0.58823529 alpha:1.0]

// Background color for the horizontal table view (the one embedded inside the rows of our vertical table)
//#define kHorizontalTableBackgroundColor             [UIColor colorWithRed:0.6745098 green:0.6745098 blue:0.6745098 alpha:1.0]
#define kHorizontalTableBackgroundColor             [UIColor clearColor]

// The background color on the horizontal table view for when we select a particular cell
#define kHorizontalTableSelectedBackgroundColor     [UIColor colorWithRed:0.0 green:0.59607843 blue:0.37254902 alpha:1.0]

#endif
