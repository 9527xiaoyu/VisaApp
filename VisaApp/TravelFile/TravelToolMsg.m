//
//  TravelToolMsg.m
//  TravelDemo
//
//  Created by yxy on 17/2/18.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "TravelToolMsg.h"
#import "WeatherOfCityModel.h"
#import "DailyWeatherOfCityModel.h"
#import "paritiesTypeModel.h"
#import "RealTimeCurrencyModel.h"

@implementation TravelToolMsg
static TravelToolMsg* instance;

+(instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance=[[super allocWithZone:NULL]init];
    });
    return instance;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL]init];
    });
    return instance;
}

-(id)copyWithZone:(struct _NSZone *)zone
{
    return [TravelToolMsg shareInstance] ;
}

-(void)Travel_CurrentWeatherOfCityWithManager:(TPWeatherManager *)manager CityName:(NSString *)cityname Result:(CurrentWeatherOfCityBlock)block{
    
    [manager getCurrentWeatherOfCity:[TPCity cityWithName:cityname]
                                 inLanguage:kSimplifiedChinese
                                       unit:kCelsius
                                 completion:^(TPWeatherNow *weatherNow, NSError *err) {
                                     NSMutableArray *postArray=[NSMutableArray array];
                                     
                                     if(weatherNow != nil) {
                                         NSString *text=weatherNow.text;
                                         //天气现象代码，例如"4"
                                         NSString *code=weatherNow.code;
                                         //温度。单位为c摄氏度或f华氏度。
                                         NSNumber *temperature= [NSNumber numberWithInteger: weatherNow.temperature];
                                         //体感温度。单位为c摄氏度或f华氏度。
                                         NSNumber *feelsLikeTemperature=[NSNumber numberWithInteger: weatherNow.feelsLikeTemperature];
                                         //风向文字, 例如"西北"
                                         NSString *windDirection=weatherNow.windDirection;
                                         //风向角度。范围0~359, 0为正北，90为正东，180为正南，270为正西。
                                         NSNumber *windDirectionDegree=[NSNumber numberWithInteger: weatherNow.windDirectionDegree];
                                         //风速。单位为km/h公里每小时或mph英里每小时
                                         NSNumber *windSpeed=[NSNumber numberWithInteger: weatherNow.windSpeed];
                                         //风力等级
                                         NSNumber *windScale=[NSNumber numberWithInteger: weatherNow.windScale];
                                         //相对湿度, 范围0~1
                                         NSNumber *humidity=[NSNumber numberWithInteger: weatherNow.humidity];
                                         //能见度。单位为km公里或mi英里
                                         NSNumber *visibility=[NSNumber numberWithInteger: weatherNow.visibility];
                                         //气压。单位为mb百帕或in英寸
                                         NSNumber *pressure=[NSNumber numberWithInteger: weatherNow.pressure];
                                         //云量。天空被云覆盖的面积占比，范围0~1
                                         NSNumber *clouds=[NSNumber numberWithInteger: weatherNow.clouds];
                                         //露点温度
                                         NSNumber *dewPoint=[NSNumber numberWithInteger: weatherNow.dewPoint];
                                         //数据更新时间
                                         NSDate *lastUpdateDate=weatherNow.lastUpdateDate;
//                                         NSLog(@"%@",weatherNow.text);//获取天气文本信息，例如“晴”，“多云”
//                                         NSLog(@"%@",weatherNow.windDirection);//获取当前风向，例如“西北”
//                                         NSLog(@"%ld",(long)weatherNow.feelsLikeTemperature);//获取当前体感温度
                                         NSMutableDictionary *postDict=[NSMutableDictionary dictionaryWithObjectsAndKeys:text,@"text",
                                                                        code ,@"code",
                                                                        temperature,@"temperature",
                                                                        feelsLikeTemperature,@"feelsLikeTemperature",
                                                                        windDirection,@"windDirection",
                                                                        windDirectionDegree,@"windDirectionDegree",
                                                                        windSpeed,@"windSpeed",
                                                                        windScale,@"windScale",
                                                                        humidity,@"humidity",
                                                                        visibility,@"visibility",
                                                                        pressure,@"pressure",
                                                                        clouds,@"clouds",
                                                                        dewPoint,@"dewPoint",
                                                                        lastUpdateDate,@"lastUpdateDate", nil];
                                         
                                         WeatherOfCityModel *WModel=[WeatherOfCityModel WeatherOfCityModelWithDict:postDict];
                                         [postArray addObject:WModel];
                                     }
                                     block(postArray);
                                 }];
}

-(void)Travel_DailyWeatherOfCityWithManager:(TPWeatherManager *)manager CityName:(NSString *)cityname StartDay:(NSDate *)date Days:(NSInteger)days Result:(DailyWeatherOfCityBlock)block{
    [manager getDailyWeatherOfCity:[TPCity cityWithName:cityname] inLanguage:kSimplifiedChinese unit:kCelsius fromDate:date days:days completion:^(NSArray<TPWeatherDaily *> *weatherDailyArray, NSError *error) {
        NSMutableArray *postArr=[NSMutableArray array];
        for (int index=0; index<weatherDailyArray.count; index++) {
//            NSLog(@"%@",weatherDailyArray[index].date);
            
            NSDate *date=weatherDailyArray[index].date;
            NSString *textForDay=weatherDailyArray[index].textForDay;
            NSString *codeForDay=weatherDailyArray[index].codeForDay;
            NSString *textForNight=weatherDailyArray[index].textForNight;
            NSString *codeForNight=weatherDailyArray[index].codeForNight;
            NSNumber *highTemperature=[NSNumber numberWithInteger:weatherDailyArray[index].highTemperature];
            NSNumber *lowTemperature=[NSNumber numberWithInteger:weatherDailyArray[index].lowTemperature];
            NSNumber *chanceOfRain=[NSNumber numberWithInteger:weatherDailyArray[index].chanceOfRain];
            NSString *windDirection=weatherDailyArray[index].windDirection;
            NSNumber *windDirectionDegree=[NSNumber numberWithInteger:weatherDailyArray[index].windDirectionDegree];
            NSNumber *windSpeed=[NSNumber numberWithInteger:weatherDailyArray[index].windSpeed];
            NSNumber *windScale=[NSNumber numberWithInteger:weatherDailyArray[index].windScale];
            
            NSMutableDictionary *PostDict=[NSMutableDictionary dictionaryWithObjectsAndKeys:date,@"date",
                                           textForDay,@"textForDay",
                                          codeForDay ,@"codeForDay",
                                           textForNight,@"textForNight",
                                           codeForNight,@"codeForNight",
                                           highTemperature,@"highTemperature",
                                           lowTemperature,@"lowTemperature",
                                           chanceOfRain,@"chanceOfRain",
                                           windDirection,@"windDirection",
                                           windDirectionDegree,@"windDirectionDegree",
                                           windSpeed,@"windSpeed",
                                           windScale,@"windScale", nil];
            
            DailyWeatherOfCityModel *Dmodel=[DailyWeatherOfCityModel DailyWeatherOfCityWithDict:PostDict];
            [postArr addObject:Dmodel];
        }
        block(postArr);
    }];
}

//货币列表
-(void)CurrencylistWithResult:(CurrencyTypeBlock)block{
    
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    //创建请求地址
    NSString *url=@"http://op.juhe.cn/onebox/exchange/list?key=2dd61477d332c775048c1d14c3713e9b";
    //构造参数
    NSDictionary *parameters=@{@"Key":@"2dd61477d332c775048c1d14c3713e9b"};
    //AFN管理者调用get请求方法
    [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (block!=nil) {
            NSDictionary *getObjdict=[responseObject objectForKey:@"result"];
        
            NSArray *getObjArr=[getObjdict objectForKey:@"list"];
        
            NSMutableArray *getFirstArray=[NSMutableArray array];//一层
        
            if (getObjArr!=nil) {
                for (int index=0; index<getObjArr.count; index++) {
                    NSMutableDictionary *Dict=getObjArr[index];
                    paritiesTypeModel *parMod=[paritiesTypeModel paritiesTypeModelWithDict:Dict];
                    [getFirstArray addObject:parMod];
                };
            }
        block(getFirstArray);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

//实时汇率转换
-(void)RealTimeCurrencyWithFrom:(NSString*)from To:(NSString*)to Result:(RealTimeCurrencyBlock)block{
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    NSString *url=[NSString stringWithFormat:@"http://op.juhe.cn/onebox/exchange/currency?key=2dd61477d332c775048c1d14c3713e9b&from=%@&to=%@",from,to];
    //构造参数
    NSDictionary *parameters=@{@"Key":@"2dd61477d332c775048c1d14c3713e9b"};
    //AFN管理者调用get请求方法
    [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *getObjArr=[responseObject objectForKey:@"result"];
        NSMutableArray *getFirstArray=[NSMutableArray array];//一层
        
        if (getObjArr!=nil) {
            for (int index=0; index<getObjArr.count; index++) {
                NSMutableDictionary *Dict=getObjArr[index];
                RealTimeCurrencyModel *RealMod=[RealTimeCurrencyModel RealTimeCurrencyModelWithDict:Dict];
                [getFirstArray addObject:RealMod];
            }
        }
        block(getFirstArray);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

@end
