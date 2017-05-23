//
//  WeatherOfCityModel.h
//  TravelDemo
//
//  Created by yxy on 17/2/18.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherOfCityModel : NSObject
/*
 *天气现象文字, 例如"多云"
 */
@property (nonatomic, copy) NSString *text;

/*
 *天气现象代码，例如"4"
 */
@property (nonatomic, copy) NSString *code;

/*
 *温度。单位为c摄氏度或f华氏度。
 */
@property (nonatomic, assign) NSNumber *temperature;

/*
 *体感温度。单位为c摄氏度或f华氏度。
 */
@property (nonatomic, assign) NSNumber *feelsLikeTemperature;

/*
 *风向文字, 例如"西北"
 */
@property (nonatomic, copy) NSString *windDirection;

/*
 *风向角度。范围0~359, 0为正北，90为正东，180为正南，270为正西。
 */
@property (nonatomic, assign) NSNumber *windDirectionDegree;

/*
 *风速。单位为km/h公里每小时或mph英里每小时
 */
@property (nonatomic, assign) NSNumber* windSpeed;

/*
 *风力等级
 */
@property (nonatomic, assign) NSNumber* windScale;

/*
 *相对湿度, 范围0~1
 */
@property (nonatomic, assign) NSNumber* humidity;

/*
 *能见度。单位为km公里或mi英里
 */
@property (nonatomic, assign) NSNumber* visibility;

/*
 *气压。单位为mb百帕或in英寸
 */
@property (nonatomic, assign) NSNumber* pressure;

/*
 *云量。天空被云覆盖的面积占比，范围0~1
 */
@property (nonatomic, assign) NSNumber* clouds;

/*
 *露点温度
 */
@property (nonatomic, assign) NSNumber *dewPoint;

/*
 *数据更新时间
 */
@property (nonatomic, copy)NSDate *lastUpdateDate;

+(instancetype)WeatherOfCityModelWithDict:(NSDictionary*)dict;

@end
