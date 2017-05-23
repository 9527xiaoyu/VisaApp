//
//  UILabel+LabelHeightAndWidth.h
//  CXTransparentNav
//
//  Created by yxy on 17/1/14.
//  Copyright © 2017年 CX. All rights reserved.
//

/*
 *
 *UILabel的高度和宽度自适应
 *
 */

#import <UIKit/UIKit.h>

@interface UILabel (LabelHeightAndWidth)
+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;
@end
