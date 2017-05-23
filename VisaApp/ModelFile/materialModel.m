//
//  materialModel.m
//  test
//
//  Created by yxy on 17/1/10.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "materialModel.h"

@implementation materialModel
+(instancetype)MaterialModelWithDict:(NSDictionary *)dict{
    materialModel *model=[[materialModel alloc]init];
    NSString *title=[dict objectForKey:@"title"];
    model.title=title;
    
    return model;
}
@end
