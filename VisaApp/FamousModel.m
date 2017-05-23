//
//  FamousModel.m
//  WordFamousBrand
//
//  Created by yxy on 17/2/23.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "FamousModel.h"

@implementation FamousModel

+(instancetype)FamousModelWithDict:(NSDictionary *)dict{
    FamousModel *model=[[FamousModel alloc]init];
    NSString *image=[dict objectForKey:@"image"];
    model.image=image;
    NSString *name=[dict objectForKey:@"name"];
    model.name=name;
    NSString *company=[dict objectForKey:@"company"];
    model.company=company;
    NSString *producingArea=[dict objectForKey:@"producingArea"];
    model.producingArea=producingArea;
    NSString *intro=[dict objectForKey:@"intro"];
    model.intro=intro;
    
    return model;
}
@end
