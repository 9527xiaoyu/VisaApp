//
//  CurrentDayWeatherView.m
//  TravelDemo
//
//  Created by yxy on 17/2/18.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "CurrentDayWeatherView.h"
#import "WeatherOfCityModel.h"
#import "TravelToolMsg.h"

@interface CurrentDayWeatherView()
@property(nonatomic,strong)NSString *cityname;
@property(nonatomic,strong)TPWeatherManager *weatherManager;
@property(nonatomic,strong)WeatherOfCityModel *mod;
@end

@implementation CurrentDayWeatherView

+(instancetype)CurrentDayWeatherViewWithFrame:(CGRect)frame Manager:(TPWeatherManager *)weatherManager City:(NSString *)cityname{
    CurrentDayWeatherView *CDWV=[[CurrentDayWeatherView alloc]initWithFrame:frame WeatherManager:weatherManager City:cityname];
    
    return CDWV;
}
-(instancetype)initWithFrame:(CGRect)frame WeatherManager:(TPWeatherManager*)weatherManager City:(NSString*)cityname{
    if (self=[super initWithFrame:frame]) {
        _cityname=cityname;
        _weatherManager=weatherManager;
        [self createViews];
        
    }
    return self;
}

- (void)createViews{
    
    [[TravelToolMsg shareInstance]Travel_CurrentWeatherOfCityWithManager:_weatherManager CityName:_cityname Result:^(NSArray *WeatherArray) {
        _mod=WeatherArray[0];
        
        CGFloat offsetY=self.frame.size.height*0.67;
        _weatherView=[[UIImageView alloc] initWithFrame:CGRectMake(10, 10+offsetY, 28.0f, 28.0f)];
        _weatherView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@",_mod.code]];
        _weatherView.backgroundColor=[UIColor clearColor];
        [self addSubview:_weatherView];
        
        _weatherLabel=[[UILabel alloc] initWithFrame:CGRectMake(42, 13+offsetY, 268.0f, 21)];
        _weatherLabel.font=[UIFont systemFontOfSize:20.0f];
        _weatherLabel.textColor=[UIColor whiteColor];
        _weatherLabel.text=_mod.text;
        _weatherLabel.backgroundColor=[UIColor clearColor];
        [self addSubview:_weatherLabel];
        
        UIImageView *upperImage=[[UIImageView alloc] initWithFrame:CGRectMake(21, 49+offsetY, 6, 14)];
        upperImage.image=[UIImage imageNamed:@"Info_high"];
        [self addSubview:upperImage];
        
        _upTempLabel=[[UILabel alloc] initWithFrame:CGRectMake(36.0f, 45+offsetY, 40, 20)];
        _upTempLabel.font=[UIFont systemFontOfSize:20.0f];
        _upTempLabel.textColor=[UIColor whiteColor];
        _upTempLabel.backgroundColor=[UIColor clearColor];
        [self addSubview:_upTempLabel];
        
        UIImageView *lowerImage=[[UIImageView alloc] initWithFrame:CGRectMake(91, 49+offsetY, 6, 14)];
        lowerImage.image=[UIImage imageNamed:@"Info_low"];
        [self addSubview:lowerImage];
        
        _downTempLabel=[[UILabel alloc] initWithFrame:CGRectMake(106.0f, 45+offsetY, 40, 20)];
        _downTempLabel.font=[UIFont systemFontOfSize:20.0f];
        _downTempLabel.textColor=[UIColor whiteColor];
        _downTempLabel.backgroundColor=[UIColor clearColor];
        [self addSubview:_downTempLabel];
        
        _curTempLabel=[[UILabel alloc] initWithFrame:CGRectMake(15, 70+offsetY, 300, 80)];
        _curTempLabel.font=[UIFont systemFontOfSize:100.0f];
        _curTempLabel.text=[NSString stringWithFormat:@"%@℃",_mod.temperature];
        _curTempLabel.textColor=[UIColor whiteColor];
        _curTempLabel.backgroundColor=[UIColor clearColor];
        [self addSubview:_curTempLabel];
    }];
    
}

@end
