//
//  ShippingAddressCell.m
//  MyStretchHeader
//
//  Created by yxy on 17/3/11.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "ShippingAddressCell.h"

#define Screen_Size [UIScreen mainScreen].bounds.size
#define Screen_Origin [UIScreen mainScreen].bounds.origin
@implementation ShippingAddressCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    self.nameLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 120, 30)];
    self.nameLab.textColor=[UIColor blackColor];
    self.nameLab.font=[UIFont systemFontOfSize:16];
    self.nameLab.textAlignment=NSTextAlignmentLeft;
    [self.contentView addSubview:self.nameLab];
    
    self.phoneLab=[[UILabel alloc]initWithFrame:CGRectMake(self.nameLab.frame.size.width+30, 10, 120, 30)];
    self.phoneLab.textColor=[UIColor blackColor];
    self.phoneLab.font=[UIFont systemFontOfSize:14];
    self.phoneLab.textAlignment=NSTextAlignmentLeft;
    [self.contentView addSubview:self.phoneLab];
    
    self.selectLab=[[UILabel alloc]initWithFrame:CGRectMake(self.phoneLab.frame.origin.x+self.phoneLab.frame.size.width+30, 10, 50, 30)];
    self.selectLab.text=@"当前";
    self.selectLab.hidden=YES;
    self.selectLab.font=[UIFont systemFontOfSize:12];
    self.selectLab.textColor=[UIColor redColor];
    self.selectLab.textAlignment=NSTextAlignmentLeft;;
    [self.contentView addSubview:self.selectLab];
    
    self.addressLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 40, self.frame.size.width-40, 30)];
    self.addressLab.textColor=[UIColor blackColor];
    self.addressLab.font=[UIFont systemFontOfSize:16];
    self.addressLab.textAlignment=NSTextAlignmentLeft;
    [self.contentView addSubview:self.addressLab];
    
    self.editBtn=[[UIButton alloc]initWithFrame:CGRectMake(Screen_Size.width-50, self.frame.size.height/2+10, 30, 30)];
    [self.editBtn setImage:[UIImage imageNamed:@"edit"] forState:UIControlStateNormal];
    self.editBtn.backgroundColor=[UIColor clearColor];
    [self.contentView addSubview:self.editBtn];
}

@end
