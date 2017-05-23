//
//  ZNKeyboard.h
//  TravelDemo
//
//  Created by yxy on 17/2/21.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^textFieldValueChanged)(NSString *value);
@interface ZNKeyboard : UIView

/**
 *   textField内容变化回调
 *   value:变化之后的值
 **/
@property (copy,nonatomic)textFieldValueChanged block;
/**
 *   初始化类方法
 *   textField参数：传入的是叫出该键盘的UITextField对象
 **/
+ (instancetype)keyboardWithTextField:(UITextField *)textField Result:(textFieldValueChanged)block;

@end
