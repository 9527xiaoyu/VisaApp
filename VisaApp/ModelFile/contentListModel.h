//
//  contentListModel.h
//  test
//
//  Created by yxy on 17/1/10.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface contentListModel : NSObject
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *detial;
+(instancetype)ContentListModelWithDict:(NSDictionary *)dict;
@end
