//
//  contentListModel.m
//  test
//
//  Created by yxy on 17/1/10.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "contentListModel.h"

@implementation contentListModel
+(instancetype)ContentListModelWithDict:(NSDictionary *)dict{
    contentListModel *model=[[contentListModel alloc]init];
    NSString *title=[dict objectForKey:@"title"];
    model.title=title;
    NSString *detial=[dict objectForKey:@"detial"];
    model.detial=detial;
    
    return model;
}
@end
