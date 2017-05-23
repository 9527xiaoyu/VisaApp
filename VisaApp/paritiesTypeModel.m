//
//  paritiesTypeModel.m
//  JuheApisDemo
//
//  Created by yxy on 17/2/20.
//  Copyright © 2017年 thinkland. All rights reserved.
//

#import "paritiesTypeModel.h"

@implementation paritiesTypeModel
+(instancetype)paritiesTypeModelWithDict:(NSDictionary *)dict{
    paritiesTypeModel *model=[[paritiesTypeModel alloc]init];
    NSString *name=[dict objectForKey:@"name"];
    model.name=name;
    NSString *code=[dict objectForKey:@"code"];
    model.code=code;
    
    return model;
}
@end
