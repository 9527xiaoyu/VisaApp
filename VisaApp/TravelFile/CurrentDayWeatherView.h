//
//  CurrentDayWeatherView.h
//  TravelDemo
//
//  Created by yxy on 17/2/18.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ThinkpageAPI/TPSDK.h>

@interface CurrentDayWeatherView : UIView

@property (nonatomic, strong) UIImageView *weatherView;
@property (nonatomic, strong) UILabel *weatherLabel;
@property (nonatomic, strong) UILabel *upTempLabel;
@property (nonatomic, strong) UILabel *downTempLabel;
@property (nonatomic, strong) UILabel *curTempLabel;
/*
 * array 传入今天天气
 */
+(instancetype)CurrentDayWeatherViewWithFrame:(CGRect)frame Manager:(TPWeatherManager *)weatherManager City:(NSString*)cityname ;
@end
