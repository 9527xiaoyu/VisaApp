//
//  Process.m
//  CXTransparentNav
//
//  Created by yxy on 17/1/14.
//  Copyright © 2017年 CX. All rights reserved.
//

#import "Process.h"

@implementation Process
+(instancetype)processWithDict:(NSDictionary *)dict{
    Process *model=[[Process alloc]init];
    NSString *title=[dict objectForKey:@"title"];
    model.title=title;
    NSString *detial=[dict objectForKey:@"detial"];
    model.detial=detial;
    NSString *num=[dict objectForKey:@"num"];
    model.num=num;
    
    return model;
}
@end
