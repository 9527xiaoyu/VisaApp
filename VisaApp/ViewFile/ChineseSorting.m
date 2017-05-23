//
//  ChineseSorting.m
//  CoursewareExpert
//
//  Created by 速度哇 on 2016/11/7.
//  Copyright © 2016年 yxy. All rights reserved.
//  中文首字母转换

#import "ChineseSorting.h"

@implementation ChineseSorting

+(ChineseSorting *)sharedInstance
{
    static ChineseSorting *chinesesort = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        chinesesort = [[ChineseSorting alloc] init];
    });
    return chinesesort;
}
/*
 * 将汉字拼音首字母进行排序
 */
-(NSArray *)firstCharcterSortingOfChinese:(NSMutableArray *)array
{
    NSMutableSet *firstArr = [[NSMutableSet alloc] init];
    for (int i = 0; i < array.count; i++) {
        char cc = pinyinFirstLetter([array[i] characterAtIndex:0]);
        NSString *str = [[NSString stringWithFormat:@"%c", cc] uppercaseString];
        [firstArr addObject:str];
        
    }
    NSArray *newArray = [[firstArr allObjects] sortedArrayUsingSelector:@selector(compare:)];
    return newArray;
}

/*
 * 汉字按照拼音首字母排序存入字典中
 */
-(NSMutableDictionary *)chineseCharacterSorting:(NSMutableArray *)array KeyArray:(NSArray *)keyArray
{
    NSMutableDictionary *sectionDic = [NSMutableDictionary dictionary];
    for (int i = 0; i < keyArray.count; i++) {
        NSMutableArray *arr = [NSMutableArray array];
        for (int j = 0; j < array.count; j++) {
            char cc = pinyinFirstLetter([array[j] characterAtIndex:0]);
            NSString *first = [[NSString stringWithFormat:@"%c", cc] uppercaseString];
            if ([first isEqualToString:keyArray[i]]) {
                [arr addObject:array[j]];
            }
        }
        [sectionDic setObject:arr forKey:keyArray[i]];
    }
    return sectionDic;
    
}
#pragma 判断中文
/**
 判断输入是否为中文
 **/
- (BOOL) deptNameInputShouldChineseWithText:(NSString*)text
{
    NSString *regex = @"[\u4e00-\u9fa5]+";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if (![pred evaluateWithObject:text]) {
        return YES;
    }
    return NO;
}


#pragma 判断全数字：
/**
 判断输入是否为数字
 **/
- (BOOL) deptNumInputShouldNumberWithText:(NSString*)text
{
    NSString *regex =@"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if (![pred evaluateWithObject:text]) {
        return YES;
    }
    return NO;
}


#pragma  判断全字母：
/**
 判断输入是否为字母
 **/
- (BOOL) deptPassInputShouldAlphaWithText:(NSString*)text
{
    NSString *regex =@"[a-zA-Z]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if (![pred evaluateWithObject:text]) {
        return YES;
    }
    return NO;
}

#pragma mark ----- 邮箱地址的正则表达式
/**
 判断输入是否为正确的邮箱地址
 **/
-(BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    return [emailTest evaluateWithObject:email];
}

#pragma mark ----- 手机号码的正则表达式
/**
 判断输入是否为正确的手机号码
 **/
- (BOOL)isValidateMobile:(NSString *)mobile{
    //手机号以13、15、18开头，八个\d数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

@end
