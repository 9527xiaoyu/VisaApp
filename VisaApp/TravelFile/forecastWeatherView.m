//
//  forecastWeatherView.m
//  TravelDemo
//
//  Created by yxy on 17/2/18.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "forecastWeatherView.h"
#import "DateToWeekDay.h"

@interface forecastWeatherView()

@property(nonatomic,strong)NSString *cityname;
@property(nonatomic,strong)TPWeatherManager *weatherManager;
@property(nonatomic,strong)NSDate* startDay;
@property(nonatomic,assign)NSInteger days;
@property(nonatomic,strong)NSArray *DWeatherArrs;
@property(nonatomic,strong)DailyWeatherOfCityModel *mod;

@end

@implementation forecastWeatherView

+(instancetype)ForecastWeatherViewWithFrame:(CGRect)frame WeatherManager:(TPWeatherManager *)weatherManager City:(NSString *)cityName StartDay:(NSDate *)startDay Days:(NSInteger)days{
    forecastWeatherView *foreView=[[forecastWeatherView alloc]initWithFrame:frame WeatherManager:weatherManager City:cityName StartDay:startDay Days:days];
    
    return foreView;
}

- (id)initWithFrame:(CGRect)frame WeatherManager:(TPWeatherManager*)weatherManager City:(NSString*)cityname StartDay:(NSDate*)startDay Days:(NSInteger)days{
    self = [super initWithFrame:frame];
    if (self) {
        _cityname=cityname;
        _weatherManager=weatherManager;
        _startDay=startDay;
        _days=days;
        [self initialization];
    }
    return self;
}

-(void)initialization{
    
    // Initialization code
    UILabel *titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(30, 5, 288, 20)];
    titleLabel.font=[UIFont systemFontOfSize:17.0f];
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.backgroundColor=[UIColor clearColor];
    titleLabel.text=@"预报";
    [self addSubview:titleLabel];
    //Line
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(30, 29, 288, 1)];
    lineView.backgroundColor = [UIColor whiteColor];
    [self addSubview:lineView];
    //Row Height:67
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(30, 30, 288, 178)];
    imageView.image=[UIImage imageNamed:@"Forecast"];
    imageView.backgroundColor=[UIColor clearColor];
    [self addSubview:imageView];
    self.backgroundColor=[UIColor colorWithWhite:0.0f alpha:0.5f];

    [[TravelToolMsg shareInstance]Travel_DailyWeatherOfCityWithManager:_weatherManager CityName:_cityname StartDay:_startDay Days:_days Result:^(NSArray *DailyWeatherArr) {
        _DWeatherArrs=DailyWeatherArr;
        [self createDetailViews];
    }];
}

- (void)createDetailViews{
    _dayLabels=[[NSMutableArray alloc] init];
    _imageViews=[[NSMutableArray alloc] init];
    _upTempLabels=[[NSMutableArray alloc] init];
    _downTempLabels=[[NSMutableArray alloc] init];
    for (int index=0; index<_DWeatherArrs.count; index++) {
        CGFloat curHeight=index*33.5f+30.0f;
        _mod=_DWeatherArrs[index];
        
        UILabel *dayLabel=[[UILabel alloc] initWithFrame:CGRectMake(30, curHeight+7, 78, 20)];
        dayLabel.font=[UIFont systemFontOfSize:17.0f];
        dayLabel.textColor=[UIColor whiteColor];
        //日期转星期
        NSString* weekday=[DateToWeekDay weekdayStringFromDate:_mod.date];
        dayLabel.text=weekday;
        dayLabel.backgroundColor=[UIColor clearColor];
        [_dayLabels addObject:dayLabel];
        [self addSubview:dayLabel];
        
        UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(30+128, curHeight+2, 30, 30)];
        imageView.backgroundColor=[UIColor clearColor];
        imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@",_mod.codeForDay]];
        [_imageViews addObject:imageView];
        [self addSubview:imageView];
        
        //最高温度
        UILabel *upTempLabel=[[UILabel alloc] initWithFrame:CGRectMake(30+178, curHeight+7, 55, 20)];
        upTempLabel.font=[UIFont systemFontOfSize:17.0f];
        upTempLabel.text=[NSString stringWithFormat:@"%@",_mod.highTemperature];
        upTempLabel.textColor=[UIColor whiteColor];
        upTempLabel.backgroundColor=[UIColor clearColor];
        upTempLabel.textAlignment=NSTextAlignmentRight;
        [_upTempLabels addObject:upTempLabel];
        [self addSubview:upTempLabel];
        
        //最低温度
        UILabel *lowTempLabel=[[UILabel alloc] initWithFrame:CGRectMake(30+178+55, curHeight+7, 55, 20)];
        lowTempLabel.font=[UIFont systemFontOfSize:17.0f];
        lowTempLabel.text=[NSString stringWithFormat:@"%@",_mod.lowTemperature];
        lowTempLabel.textColor=[UIColor whiteColor];
        lowTempLabel.backgroundColor=[UIColor clearColor];
        lowTempLabel.textAlignment=NSTextAlignmentRight;
        [_downTempLabels addObject:lowTempLabel];
        [self addSubview:lowTempLabel];
    }
    self.backgroundColor=[UIColor colorWithWhite:0.0f alpha:0.5f];
}

@end
