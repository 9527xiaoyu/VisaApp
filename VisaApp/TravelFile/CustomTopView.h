//
//  CustomTopView.h
//  TravelDemo
//
//  Created by yxy on 17/2/21.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomTopViewDelegate <NSObject>

-(void)didSelectBackButton;

@end

@interface CustomTopView : UIView
@property (nonatomic,assign) id <CustomTopViewDelegate>delegate;
@end

