//
//  FamousModel.h
//  WordFamousBrand
//
//  Created by yxy on 17/2/23.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FamousModel : NSObject
@property(nonatomic,strong)NSString *image;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *company;
@property(nonatomic,strong)NSString *producingArea;
@property(nonatomic,strong)NSString *intro;

+(instancetype)FamousModelWithDict:(NSDictionary*)dict;

@end
