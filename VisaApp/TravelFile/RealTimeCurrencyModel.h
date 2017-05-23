//
//  RealTimeCurrencyModel.h
//  JuheApisDemo
//
//  Created by yxy on 17/2/20.
//  Copyright © 2017年 thinkland. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RealTimeCurrencyModel : NSObject
/*
 *持有货币
 */
@property(nonatomic,strong)NSString *currencyF;

/*
 *持有货币名称
 */
@property(nonatomic,strong)NSString *currencyF_Name;

/*
 *兑换货币
 */
@property(nonatomic,strong)NSString *currencyT;

/*
 *兑换货币名称
 */
@property(nonatomic,strong)NSString *currencyT_Name;

/*
 *兑换金额
 */
@property(nonatomic,strong)NSNumber *currencyFD;

/*
 *兑换
 */
@property(nonatomic,strong)NSNumber *exchange;

/*
 *兑换结果
 */
@property(nonatomic,strong)NSNumber *result;

/*
 *
 */
@property(nonatomic,strong)NSDate *updateTime;

+(instancetype)RealTimeCurrencyModelWithDict:(NSDictionary*)dict;
@end
