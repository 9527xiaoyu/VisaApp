//
//  HorizontalCollectionViewCell.m
//  HorizontalScrolling
//
//  Created by yxy on 17/1/12.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "HorizontalCollectionViewCell.h"

@implementation HorizontalCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    self.layer.doubleSided = NO;
    
    self.image = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2-20, 20, 40, 40)];
    self.image.backgroundColor = [UIColor clearColor];
    self.image.contentMode = UIViewContentModeCenter;
    self.image.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.name = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2-35, 70, 70, 40)];
    self.name.font = [UIFont fontWithName:@"Helvetica Neue" size:14];
    self.name.textColor=[UIColor blackColor];
    self.name.textAlignment = NSTextAlignmentCenter;
    
    [self.contentView addSubview:self.image];
    [self.contentView addSubview:self.name];
    
//    [_image mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.contentView);
//        make.top.equalTo(self.contentView).offset(30);
//        make.bottom.equalTo(_name.mas_top).offset(-10);
//    }];
//    
//    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.contentView);
//        make.top.equalTo(_image.mas_bottom).offset(10);
//        make.bottom.equalTo(self.contentView).offset(-20);
//    }];
}


@end
