//
//  ContentMsgTool.m
//  test
//
//  Created by yxy on 17/1/10.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "ContentMsgTool.h"

@implementation ContentMsgTool
static ContentMsgTool* instance;

+(instancetype)shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init] ;
    }) ;
    
    return instance ;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone] ;
    }) ;
    
    return instance ;
}

-(id)copyWithZone:(struct _NSZone *)zone
{
    return [ContentMsgTool shareInstance] ;
}

-(void)content_MCWithResult:(MCListBlock)yblock{
    NSString* plistStr=[[NSBundle mainBundle]pathForResource:@"materialList" ofType:@"plist"];
    NSMutableDictionary *data=[[NSMutableDictionary alloc]initWithContentsOfFile:plistStr];
    
    NSArray* positionArray=[data objectForKey:@"material"];
    NSMutableArray *array=[NSMutableArray array];
    //建立一个数组用于保存所有岗位模型
    NSMutableArray *mListArray=[NSMutableArray array];
    NSMutableArray *cListArray=[NSMutableArray array];
    if (positionArray!=nil) {
        for (int index=0; index<positionArray.count; index++) {
            NSDictionary *postDict=positionArray[index];
            NSArray *childcList=[postDict objectForKey:@"cList"];
            [array addObject:[NSString stringWithFormat:@"%ld",(NSInteger)childcList.count]];
            materialModel *model=[materialModel MaterialModelWithDict:postDict];
            [mListArray addObject:model];
            
            for (int indexB=0; indexB<childcList.count; indexB++) {
                NSDictionary *cListDict=childcList[indexB];
                contentListModel *CLModel=[contentListModel ContentListModelWithDict:cListDict];
                [cListArray addObject:CLModel];
            }
        }
        yblock(mListArray,cListArray,array);
    }
    
}

@end
