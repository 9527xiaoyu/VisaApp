//
//  horizontalTableViewCell.m
//  CXTransparentNav
//
//  Created by yxy on 17/1/12.
//  Copyright © 2017年 CX. All rights reserved.
//

#import "horizontalTableViewCell.h"
#import "contentListModel.h"

@interface horizontalTableViewCell()
@property(nonatomic,strong)UITableView *tabView;
@property(nonatomic,strong)contentListModel *model;
@end

@implementation horizontalTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(UITableView *)tabView{
    if (!_tabView) {
        _tabView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, _HVView.bounds.size.height) style:UITableViewStylePlain];
        _tabView.delegate=self;
        _tabView.dataSource=self;
        [_tabView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"HVTabCell"];
        
    }
    return _tabView;
}
-(NSInteger)setRowWithInteger:(NSInteger)integer{
    NSInteger backInt;
    switch (integer) {
        case 0:
            backInt=7;
            break;
        case 1:
            backInt=14;
            break;
        case 2:
            backInt=9;
            break;
        case 3:
            backInt=10;
            break;
        case 4:
            backInt=10;
            break;
            
        default:
            break;
    }
    return backInt;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return self.bRow;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"HVTabCell"];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.textLabel.textColor=[UIColor blackColor];
    if (_integer==0) {
        _model=_cArrs[indexPath.row];
        cell.textLabel.text=_model.title;
        return cell;
    }else if (_integer==1){
        _model=_cArrs[indexPath.row+7];
        cell.textLabel.text=_model.title;
        return cell;
    }else if (_integer==2){
        _model=_cArrs[indexPath.row+21];
        cell.textLabel.text=_model.title;
        return cell;
    }else if (_integer==3){
        _model=_cArrs[indexPath.row+30];
        cell.textLabel.text=_model.title;
        return cell;
    }
        _model=_cArrs[indexPath.row+40];
        cell.textLabel.text=_model.title;
    
    return cell;
}
@end
