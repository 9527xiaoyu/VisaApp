//
//  HuxToNomal.h
//  MyStretchHeader
//
//  Created by yxy on 17/3/10.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HuxToNormal : NSObject
/*
 *传入字符串后分段截取调用字符串转换Int的方法
 */
- (UIColor *)getColor:(NSString *)hexColor;
/*
 *截取后的字符串处理
 */
- (int)stringToInt:(NSString *)string;
@end
