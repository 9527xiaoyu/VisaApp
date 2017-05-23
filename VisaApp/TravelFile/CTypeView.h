//
//  CTypeView.h
//  TravelDemo
//
//  Created by yxy on 17/2/20.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFDropDown.h"
#import "ZFColor.h"
#import "CurrencyTableViewCell.h"

typedef void(^CTypeViewBlock)(NSString *choseStr);
@interface CTypeView : UIView
@property(nonatomic,strong)CTypeViewBlock block;

+(instancetype)CTypeViewWithFrame:(CGRect)frame Array:(NSArray*)dataSource Result:(CTypeViewBlock)block;
@end
