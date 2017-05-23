//
//  TravelToolMsg.h
//  TravelDemo
//
//  Created by yxy on 17/2/18.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ThinkpageAPI/TPSDK.h>
#import <AFNetworking.h>

typedef void(^CurrentWeatherOfCityBlock)(NSArray* WeatherArray);
typedef void(^DailyWeatherOfCityBlock)(NSArray *DailyWeatherArr);

typedef void(^RealTimeCurrencyBlock)(NSArray* RealTimeCurrencyArr);
typedef void(^CurrencyTypeBlock)(NSArray* CurrencyTypeArr);
@interface TravelToolMsg : NSObject

+(instancetype)shareInstance;
+(instancetype)allocWithZone:(struct _NSZone *)zone;

/*
 *天气实况
 */
-(void)Travel_CurrentWeatherOfCityWithManager:(TPWeatherManager*)manager CityName:(NSString*)cityname Result:(CurrentWeatherOfCityBlock)block;

/*
 * 逐日天气 3天
 */
-(void)Travel_DailyWeatherOfCityWithManager:(TPWeatherManager*)manager CityName:(NSString*)cityname StartDay:(NSDate*)date Days:(NSInteger)days Result:(DailyWeatherOfCityBlock)block;

/*
 *货币列表
 */
-(void)CurrencylistWithResult:(CurrencyTypeBlock)block;
/*
 *实时汇率查询转换
 */
-(void)RealTimeCurrencyWithFrom:(NSString*)from To:(NSString*)to Result:(RealTimeCurrencyBlock)block;

@end
