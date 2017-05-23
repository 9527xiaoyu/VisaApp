//
//  DailyWeatherOfCityModel.m
//  TravelDemo
//
//  Created by yxy on 17/2/18.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "DailyWeatherOfCityModel.h"

@implementation DailyWeatherOfCityModel

+(instancetype)DailyWeatherOfCityWithDict:(NSDictionary *)dict{
    DailyWeatherOfCityModel *model=[[DailyWeatherOfCityModel alloc]init];
    NSDate *date=[dict objectForKey:@"date"];
    model.date=date;
    NSString *textForDay=[dict objectForKey:@"textForDay"];
    model.textForDay=textForDay;
    NSString *codeForDay=[dict objectForKey:@"codeForDay"];
    model.codeForDay=codeForDay;
    NSString *textForNight=[dict objectForKey:@"textForNight"];
    model.textForNight=textForNight;
    NSString *codeForNight=[dict objectForKey:@"codeForNight"];
    model.codeForNight=codeForNight;
    NSNumber *highTemperature=[dict objectForKey:@"highTemperature"];
    model.highTemperature=highTemperature;
    NSNumber *lowTemperature=[dict objectForKey:@"lowTemperature"];
    model.lowTemperature=lowTemperature;
    NSNumber *chanceOfRain=[dict objectForKey:@"chanceOfRain"];
    model.chanceOfRain=chanceOfRain;
    NSString *windDirection=[dict objectForKey:@"windDirection"];
    model.windDirection=windDirection;
    NSNumber *windDirectionDegree=[dict objectForKey:@"windDirectionDegree"];
    model.windDirectionDegree=windDirectionDegree;
    NSNumber *windSpeed=[dict objectForKey:@"windSpeed"];
    model.windSpeed=windSpeed;
    NSNumber *windScale=[dict objectForKey:@"windScale"];
    model.windScale=windScale;
    
    return model;
}
@end
