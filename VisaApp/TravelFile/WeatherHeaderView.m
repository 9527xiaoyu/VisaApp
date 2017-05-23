//
//  WeatherHeaderView.m
//  TravelDemo
//
//  Created by yxy on 17/2/18.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "WeatherHeaderView.h"

#define  Width [UIScreen mainScreen].bounds.size.width

@implementation WeatherHeaderView

+(instancetype)WeatherHeaderViewWithFrame:(CGRect)frame CityName:(NSString *)cityName{
    WeatherHeaderView *WHV=[[WeatherHeaderView alloc]initWithFrame:frame CityName:cityName];
    return WHV;
}

-(instancetype)initWithFrame:(CGRect)frame CityName:(NSString*)cityname{
    if (self=[super initWithFrame:frame]) {
        
        _searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(Width-60, self.frame.size.height/2-15, 30, 30)];
        [_searchBtn setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
        
        [self addSubview:_searchBtn];
        
        UILabel *cityLabel=[[UILabel alloc] initWithFrame:CGRectMake(Width/2-100, 0, 200, 60)];
        cityLabel.font=[UIFont systemFontOfSize:30];
        cityLabel.textColor=[UIColor whiteColor];
        cityLabel.backgroundColor=[UIColor clearColor];
        cityLabel.textAlignment=NSTextAlignmentCenter;
        cityLabel.text=cityname;
        [self addSubview:cityLabel];
    }
    return self;
}

@end
