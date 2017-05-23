//
//  CurrencyTableViewCell.m
//  TravelDemo
//
//  Created by yxy on 17/2/20.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "CurrencyTableViewCell.h"
#import "ZFColor.h"

@implementation CurrencyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    
    self.txtLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 70, 34)];
    self.txtLabel.numberOfLines = 0;
    self.txtLabel.textColor = ZFSystemBlue;
    self.txtLabel.font = [UIFont systemFontOfSize:14.f];
    [self.contentView addSubview:self.txtLabel];
    
    self.subTxtLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 5, 40, 34)];
    self.subTxtLabel.numberOfLines = 0;
    self.subTxtLabel.textColor = ZFLightGray;
    self.subTxtLabel.font = [UIFont systemFontOfSize:13.f];
    [self.contentView addSubview:self.subTxtLabel];
}
@end
