//
//  BaseMessageTableViewCell.h
//  CXTransparentNav
//
//  Created by yxy on 17/1/13.
//  Copyright © 2017年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseMessageTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *headLab;
@property (weak, nonatomic) IBOutlet UILabel *severLab;
@property (weak, nonatomic) IBOutlet UILabel *severDetialLab;
@property (weak, nonatomic) IBOutlet UILabel *addressLab;
@property (weak, nonatomic) IBOutlet UILabel *addressDetialLab;

@end
