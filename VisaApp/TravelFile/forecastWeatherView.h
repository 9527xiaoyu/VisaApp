//
//  forecastWeatherView.h
//  TravelDemo
//
//  Created by yxy on 17/2/18.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ThinkpageAPI/TPSDK.h>
#import "TravelToolMsg.h"
#import "DailyWeatherOfCityModel.h"

@interface forecastWeatherView : UIView
@property (nonatomic, strong) NSMutableArray *dayLabels;
@property (nonatomic, strong) NSMutableArray *imageViews;
@property (nonatomic, strong) NSMutableArray *upTempLabels;
@property (nonatomic, strong) NSMutableArray *downTempLabels;

+(instancetype)ForecastWeatherViewWithFrame:(CGRect)frame WeatherManager:(TPWeatherManager*)weatherManager City:(NSString*)cityName StartDay:(NSDate*)startDay Days:(NSInteger)days;

@end
