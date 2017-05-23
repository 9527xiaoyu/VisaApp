//
//  WeatherHeaderView.h
//  TravelDemo
//
//  Created by yxy on 17/2/18.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherHeaderView : UIView

@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic,strong) UIButton *searchBtn;

+(instancetype)WeatherHeaderViewWithFrame:(CGRect)frame CityName:(NSString*)cityName;
@end
