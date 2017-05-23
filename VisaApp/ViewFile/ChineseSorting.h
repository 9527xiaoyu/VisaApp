//
//  ChineseSorting.h
//  CoursewareExpert
//
//  Created by 速度哇 on 2016/11/7.
//  Copyright © 2016年 yxy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "pinyin.h"

@interface ChineseSorting : NSObject

/***
 *
 汉字首字母排序 -- 参数为存放汉字的数组
 *
 **/
- (NSArray *)firstCharcterSortingOfChinese:(NSMutableArray *)array;

/*
 *
 **汉字排序方法 -- 第一个参数为存放汉字的数组 ,第二个参数为汉字拼音首字母的数组(通过调用上面的方法获取)
 
 ******** 返回的字典 key 为keyArray里的参数(即排好顺序的拼音首字母)
 */
- (NSMutableDictionary *)chineseCharacterSorting:(NSMutableArray *)array KeyArray:(NSArray *)keyArray;
- (BOOL) deptPassInputShouldAlphaWithText:(NSString*)text;
- (BOOL) deptNumInputShouldNumberWithText:(NSString*)text;
- (BOOL) deptNameInputShouldChineseWithText:(NSString*)text;

#pragma mark ----- 邮箱地址的正则表达式
-(BOOL)isValidateEmail:(NSString *)email;
#pragma mark ----- 手机号码的正则表达式
- (BOOL)isValidateMobile:(NSString *)mobile;

+ (ChineseSorting *)sharedInstance;

@end
