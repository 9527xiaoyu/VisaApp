//
//  ResultCityController.h
//  TravelDemo
//
//  Created by yxy on 17/2/21.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ResultCityControllerDelegate <NSObject>

-(void)didScroll;
-(void)didSelectedString:(NSString *)string;

@end

@interface ResultCityController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain)NSMutableArray *dataArray;
@property (nonatomic,retain)UITableView *tableView;
@property (nonatomic,assign) id <ResultCityControllerDelegate>delegate;
@end

