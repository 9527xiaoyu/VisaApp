//
//  WeatherOfCityModel.m
//  TravelDemo
//
//  Created by yxy on 17/2/18.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "WeatherOfCityModel.h"

@implementation WeatherOfCityModel

+(instancetype)WeatherOfCityModelWithDict:(NSDictionary *)dict{
    WeatherOfCityModel *model=[[WeatherOfCityModel alloc]init];
    //天气现象文字, 例如"多云"
    NSString *text=[dict objectForKey:@"text"];
    model.text=text;
    //天气现象代码，例如"4"
    NSString *code=[dict objectForKey:@"code"];
    model.code=code;
    //温度。单位为c摄氏度或f华氏度。
    NSNumber *temperature=[dict objectForKey:@"temperature"];
    model.temperature=temperature;
    //体感温度。单位为c摄氏度或f华氏度。
    NSNumber *feelsLikeTemperature=[dict objectForKey:@"feelsLikeTemperature"];
    model.feelsLikeTemperature=feelsLikeTemperature;
    //风向文字, 例如"西北"
    NSString *windDirection=[dict objectForKey:@"windDirection"];
    model.windDirection=windDirection;
    //风向角度。范围0~359, 0为正北，90为正东，180为正南，270为正西。
    NSNumber *windDirectionDegree=[dict objectForKey:@"windDirectionDegree"];
    model.windDirectionDegree=windDirectionDegree;
    //风速。单位为km/h公里每小时或mph英里每小时
    NSNumber *windSpeed=[dict objectForKey:@"windSpeed"];
    model.windSpeed=windSpeed;
    //风力等级
    NSNumber *windScale=[dict objectForKey:@"windScale"];
    model.windScale=windScale;
    //相对湿度, 范围0~1
    NSNumber *humidity=[dict objectForKey:@"humidity"];
    model.humidity=humidity;
    //能见度。单位为km公里或mi英里
    NSNumber *visibility=[dict objectForKey:@"visibility"];
    model.visibility=visibility;
    //气压。单位为mb百帕或in英寸
    NSNumber *pressure=[dict objectForKey:@"pressure"];
    model.pressure=pressure;
    //云量。天空被云覆盖的面积占比，范围0~1
    NSNumber *clouds=[dict objectForKey:@"clouds"];
    model.clouds=clouds;
    //露点温度
    NSNumber *dewPoint=[dict objectForKey:@"dewPoint"];
    model.dewPoint=dewPoint;
    //数据更新时间
    NSDate *lastUpdateDate=[dict objectForKey:@"lastUpdateDate"];
    model.lastUpdateDate=lastUpdateDate;
    return model;
}
@end
