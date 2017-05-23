//
//  RealTimeCurrencyModel.m
//  JuheApisDemo
//
//  Created by yxy on 17/2/20.
//  Copyright © 2017年 thinkland. All rights reserved.
//

#import "RealTimeCurrencyModel.h"

@implementation RealTimeCurrencyModel
+(instancetype)RealTimeCurrencyModelWithDict:(NSDictionary *)dict{
    RealTimeCurrencyModel *model=[[RealTimeCurrencyModel alloc]init];
    /*
     *持有货币
     */
    NSString *currencyF=[dict objectForKey:@"currencyF"];
    model.currencyF=currencyF;
    
     /*
     *持有货币名称
     */
    NSString *currencyF_Name=[dict objectForKey:@"currencyF_Name"];
    model.currencyF_Name=currencyF_Name;
    
     /*
     *兑换货币
     */
    NSString *currencyT=[dict objectForKey:@"currencyT"];
    model.currencyT=currencyT;
    
    /*
     *兑换货币名称
     */
    NSString *currencyT_Name=[dict objectForKey:@"currencyT_Name"];
     model.currencyT_Name=currencyT_Name;
    
     /*
     *兑换金额
     */
    NSNumber *currencyFD=[dict objectForKey:@"currencyFD"];
     model.currencyFD=currencyFD;
    
    /*
     *兑换
     */
    NSNumber *exchange=[dict objectForKey:@"exchange"];
     model.exchange=exchange;
    
    /*
     *兑换结果
     */
    NSNumber *result=[dict objectForKey:@"result"];
     model.result=result;
    
    /*
     *更新时间
     */
    NSDate *updateTime=[dict objectForKey:@"updateTime"];
     model.updateTime=updateTime;
    
    return model;
}
@end
