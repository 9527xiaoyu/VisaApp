//
//  FamousBrandCell.m
//  WordFamousBrand
//
//  Created by yxy on 17/2/23.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "FamousBrandCell.h"

@implementation FamousBrandCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    self.imgView=[[UIImageView alloc]initWithFrame:CGRectMake(20, self.frame.size.height/2-25, 50, 50)];
    [self.contentView addSubview:self.imgView];
    
    self.nameLab=[[UILabel alloc]initWithFrame:CGRectMake(80, 10, 120, 30)];
    self.nameLab.numberOfLines=0;
    self.nameLab.textColor=[UIColor blackColor];
    self.nameLab.font=[UIFont systemFontOfSize:16];
    [self.contentView addSubview:self.nameLab];
    
    self.areaLab=[[UILabel alloc]initWithFrame:CGRectMake(280, 10, 100, 30)];
    self.areaLab.numberOfLines=0;
    self.areaLab.textColor=[UIColor blackColor];
    self.areaLab.font=[UIFont systemFontOfSize:16];
    [self.contentView addSubview:self.areaLab];
    
    self.companyLab=[[UILabel alloc]initWithFrame:CGRectMake(80, 50, self.frame.size.width-100, 30)];
    self.companyLab.numberOfLines=0;
    self.companyLab.textColor=[UIColor blackColor];
    self.companyLab.font=[UIFont systemFontOfSize:16];
    [self.contentView addSubview:self.companyLab];
    
    self.introLab=[[UILabel alloc]initWithFrame:CGRectMake(80, 90, self.frame.size.width-100, 70)];
    self.introLab.numberOfLines=0;
    self.introLab.textColor=[UIColor blackColor];
    self.introLab.font=[UIFont systemFontOfSize:16];
    self.introLab.lineBreakMode = NSLineBreakByWordWrapping;
    [self.contentView addSubview:self.introLab];
}


@end
