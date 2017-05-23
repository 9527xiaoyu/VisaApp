//
//  NavTitleView.h
//  TravelDemo
//
//  Created by yxy on 17/2/17.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TitleViewBlock)(UIButton *btn);

@interface NavTitleView : UIView
/**
 *  button点击回调block
 */
@property(nonatomic,copy)TitleViewBlock block;

/**
 *  初始化构造方法
 *
 *  @param  block 回调block
 *
 *  @return self
 */
+(instancetype)TitleViewWithBlock:(TitleViewBlock)block;

@end
