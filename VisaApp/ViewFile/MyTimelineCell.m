//
//  MyTimelineCell.m
//  orderDemo
//
//  Created by yxy on 17/4/22.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "MyTimelineCell.h"

@implementation MyTimelineCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self SetupUI];
    }
    return self;
}

-(void)SetupUI{
    self.topLine=[[UIView alloc]initWithFrame:CGRectMake(21, 0, 3, 25)];
    [self addSubview:self.topLine];
    /////
    self.buttomLine=[[UIView alloc]initWithFrame:CGRectMake(21, 44, 3, 25)];
    [self addSubview:self.buttomLine];
    /////
    UIImageView *timeline=[[UIImageView alloc]initWithFrame:CGRectMake(3, 10, 40, 40)];
    timeline.image=[UIImage imageNamed:@"timeline"];
    timeline.backgroundColor=[UIColor clearColor];
    [self addSubview:timeline];
    /////
    UIImageView *titleImage=[[UIImageView alloc]initWithFrame:CGRectMake(40, 2, [UIScreen mainScreen].bounds.size.width-50, 56)];
    titleImage.image=[UIImage imageNamed:@"titleImage"];
    titleImage.backgroundColor=[UIColor clearColor];
    [self addSubview:titleImage];
    /////
    self.lineLabel=[[UILabel alloc]initWithFrame:CGRectMake(40, 4, titleImage.frame.size.width-12, 20)];
    self.lineLabel.textColor=[UIColor colorWithRed:0 green:0.8 blue:0 alpha:1];
    self.lineLabel.font=[UIFont systemFontOfSize:16];
    self.lineLabel.numberOfLines=0;
    [titleImage addSubview:self.lineLabel];
    /////
    self.timeLabel=[[UILabel alloc]initWithFrame:CGRectMake(40, 28, titleImage.frame.size.width-12, 20)];
    self.timeLabel.textColor=[UIColor colorWithRed:0 green:0.7 blue:0 alpha:1];
    self.timeLabel.font=[UIFont systemFontOfSize:14];
    [titleImage addSubview:self.timeLabel];
}
//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
