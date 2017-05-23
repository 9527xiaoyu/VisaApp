//
//  MyTimelineCell.h
//  orderDemo
//
//  Created by yxy on 17/4/22.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTimelineCell : UITableViewCell
@property(nonatomic,strong)UIView *topLine;
@property(nonatomic,strong)UIView *buttomLine;
@property(nonatomic,strong)UILabel *lineLabel;
@property(nonatomic,strong)UILabel *timeLabel;

@end
