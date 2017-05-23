//
//  Process.h
//  CXTransparentNav
//
//  Created by yxy on 17/1/14.
//  Copyright © 2017年 CX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Process : NSObject
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *detial;
@property(nonatomic,strong)NSString *num;

+(instancetype)processWithDict:(NSDictionary *)dict;

@end
