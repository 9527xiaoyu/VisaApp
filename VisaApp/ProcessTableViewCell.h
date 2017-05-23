//
//  ProcessTableViewCell.h
//  CXTransparentNav
//
//  Created by yxy on 17/1/14.
//  Copyright © 2017年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProcessTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *fuhaoLab;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *detialLab;
@property (weak, nonatomic) IBOutlet UIView *lineUp;
@property (weak, nonatomic) IBOutlet UIView *lineDown;

@end
