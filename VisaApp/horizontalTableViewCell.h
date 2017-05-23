//
//  horizontalTableViewCell.h
//  CXTransparentNav
//
//  Created by yxy on 17/1/12.
//  Copyright © 2017年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface horizontalTableViewCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *horizontalView;

@property (weak, nonatomic) IBOutlet UIView *HVView;

@property(nonatomic,strong)NSArray *cArrs;
@property(nonatomic,assign)NSInteger integer;
@property(nonatomic,assign)NSInteger bRow;

@end
