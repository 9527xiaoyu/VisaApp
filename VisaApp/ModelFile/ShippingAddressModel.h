//
//  ShippingAddressModel.h
//  MyStretchHeader
//
//  Created by yxy on 17/3/13.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShippingAddressModel : NSObject
@property(nonatomic,assign)NSNumber *SA_Id;
@property(nonatomic,strong)NSString *SA_name;
@property(nonatomic,strong)NSString *SA_phoneNumber;
@property(nonatomic,strong)NSString *SA_email;
@property(nonatomic,strong)NSString *SA_area;
@property(nonatomic,strong)NSString *SA_address;
@property(nonatomic,assign)NSNumber *SA_selected;

+(instancetype)ShippingAddressModelWithDict:(NSDictionary*)dict;
@end
