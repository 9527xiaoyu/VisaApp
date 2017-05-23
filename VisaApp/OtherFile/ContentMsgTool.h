//
//  ContentMsgTool.h
//  test
//
//  Created by yxy on 17/1/10.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "materialModel.h"
#import "contentListModel.h"

typedef void (^MCListBlock)(NSArray *materialList,NSArray*contentlist,NSArray *array);

@interface ContentMsgTool : NSObject
+(instancetype)shareInstance;
+(instancetype)allocWithZone:(struct _NSZone *)zone;

-(void)content_MCWithResult:(MCListBlock)yblock;
@end
