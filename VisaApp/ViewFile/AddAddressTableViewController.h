//
//  AddAddressTableViewController.h
//  MyStretchHeader
//
//  Created by yxy on 17/3/11.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShippingAddressModel.h"

@interface AddAddressTableViewController : UITableViewController
@property(nonatomic,strong)NSString *type;//记录 是添加 还是编辑

//编辑状态下传值
@property(nonatomic,assign)ShippingAddressModel *SA_model;

@end
