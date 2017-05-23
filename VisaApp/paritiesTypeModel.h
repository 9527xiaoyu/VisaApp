//
//  paritiesTypeModel.h
//  JuheApisDemo
//
//  Created by yxy on 17/2/20.
//  Copyright © 2017年 thinkland. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface paritiesTypeModel : NSObject
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *code;

+(instancetype)paritiesTypeModelWithDict:(NSDictionary*)dict;
@end
