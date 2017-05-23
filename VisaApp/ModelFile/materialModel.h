//
//  materialModel.h
//  test
//
//  Created by yxy on 17/1/10.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface materialModel : NSObject
@property(nonatomic,strong)NSString *title;
+(instancetype)MaterialModelWithDict:(NSDictionary *)dict;
@end
