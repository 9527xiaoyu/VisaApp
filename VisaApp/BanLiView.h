//
//  BanLiView.h
//  myView
//
//  Created by yxy on 17/1/6.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BanLiView;
typedef void(^BanLiViewBlock)(BanLiView* uploadFileView );

@interface BanLiView : UIView

@property (nonatomic,copy)BanLiViewBlock callBlock;

+(instancetype)BanLiViewWithBlock:(BanLiViewBlock)block;
//显示
-(void)show;
//销毁类
-(void)dismissView;

@end
