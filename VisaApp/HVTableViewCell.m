//
//  HVTableViewCell.m
//  CXTransparentNav
//
//  Created by yxy on 17/1/13.
//  Copyright © 2017年 CX. All rights reserved.
//

#import "HVTableViewCell.h"

@implementation HVTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

-(void)initialize{
    self.name=[[UILabel alloc]initWithFrame:CGRectMake(30, 7, self.bounds.size.width, 30)];
    self.name.font=[UIFont systemFontOfSize:14];
    self.name.textColor=[UIColor blackColor];
    self.name.numberOfLines=0;
    self.name.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.name];
}
@end
