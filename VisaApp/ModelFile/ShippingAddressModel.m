//
//  ShippingAddressModel.m
//  MyStretchHeader
//
//  Created by yxy on 17/3/13.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "ShippingAddressModel.h"

@implementation ShippingAddressModel

+(instancetype)ShippingAddressModelWithDict:(NSDictionary *)dict{
    ShippingAddressModel *model=[[ShippingAddressModel alloc]init];
    NSNumber *SA_Id=[dict objectForKey:@"id"];
    model.SA_Id=SA_Id;
    NSString *SA_name=[dict objectForKey:@"name"];
    model.SA_name=SA_name;
    NSString *SA_phoneNumber=[dict objectForKey:@"phoneNumber"];
    model.SA_phoneNumber=SA_phoneNumber;
    NSString *SA_email=[dict objectForKey:@"email"];
    model.SA_email=SA_email;
    NSString *SA_area=[dict objectForKey:@"area"];
    model.SA_area=SA_area;
    NSString *SA_address=[dict objectForKey:@"address"];
    model.SA_address=SA_address;
    NSNumber *SA_selected=[dict objectForKey:@"selected"];
    model.SA_selected=SA_selected;
    
    return model;
}
@end
