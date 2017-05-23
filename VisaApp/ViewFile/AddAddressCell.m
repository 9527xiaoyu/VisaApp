//
//  AddAddressCell.m
//  MyStretchHeader
//
//  Created by yxy on 17/3/11.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "AddAddressCell.h"
#define Screen_Width self.frame.size.width
@implementation AddAddressCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self SetupUI];
    }
    return self;
}

-(void)SetupUI{
    _lab=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 20)];
    _lab.font=[UIFont systemFontOfSize:14];
    _lab.textColor=[UIColor grayColor];
    _lab.hidden=YES;
    _txtField=[[UITextField alloc]initWithFrame:CGRectMake(10, 0, Screen_Width, 50)];
//    _txtField.delegate=self;
    _txtField.font=[UIFont systemFontOfSize:18];
    
    [self.contentView addSubview:_txtField];
    [self.contentView addSubview:_lab];
}

@end
