//
//  ShippingAddressTableViewController.m
//  MyStretchHeader
//
//  Created by yxy on 17/3/11.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "ShippingAddressTableViewController.h"
#import "UILabel+LabelHeightAndWidth.h"
#import "ShippingAddressCell.h"
#import "ShippingAddressModel.h"
#import "AddAddressTableViewController.h"
#import "ContentMsgTool.h"

#define Screen_Width [UIScreen mainScreen].bounds.size.width
@interface ShippingAddressTableViewController ()
@property(nonatomic,strong)NSArray *SAArray;
@end

@implementation ShippingAddressTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"收货地址";
    
    UIBarButtonItem *leftBtnItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem=leftBtnItem;
    UIBarButtonItem *rightBtnItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"add"] style:UIBarButtonItemStylePlain target:self action:@selector(addAddress)];
    self.navigationItem.rightBarButtonItem=rightBtnItem;
    
//    [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.tableView registerClass:[ShippingAddressCell class] forCellReuseIdentifier:@"cell"];
    
}

-(void)viewWillAppear:(BOOL)animated{
    //每次加载页面都获取数据
    
    //创建数据库
    [[ContentMsgTool shareInstance]nicework_createDataBaseWithView:self.view];
    //读取数据库
    [[ContentMsgTool shareInstance]nicework_selectDataBaseWithView:self.view Result:^(NSArray *array) {
        _SAArray=array;
        
    }];
    [self.tableView reloadData];
}

-(void)viewDidDisappear:(BOOL)animated{
    //每次跳出都清除数据
    self.SAArray=nil;
    self.tableView=nil;
//    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _SAArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    ShippingAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    ShippingAddressModel *SA_model=_SAArray[indexPath.row];
    
    cell.nameLab.text=SA_model.SA_name;
    UIFont *font_16=[self InputFontWithType:@"system" Size:16];
    CGFloat nameLabWidth=[UILabel getWidthWithTitle:cell.nameLab.text font:font_16];
    if (nameLabWidth<120) {
        cell.nameLab.frame=CGRectMake(20, 10, nameLabWidth, 30);
    }
    
    //
    cell.phoneLab.text=SA_model.SA_phoneNumber;
    UIFont *font_14=[self InputFontWithType:@"system" Size:14];
    CGFloat phoneLabWith=[UILabel getWidthWithTitle:cell.phoneLab.text font:font_14];
    cell.phoneLab.frame=CGRectMake(cell.nameLab.frame.size.width+30, 10, phoneLabWith, 30);
    
    //
    cell.addressLab.text=[NSString stringWithFormat:@"%@%@",SA_model.SA_area,SA_model.SA_address];
    CGFloat addressLabWdth=[UILabel getWidthWithTitle:cell.addressLab.text font:font_16];
    if (addressLabWdth>cell.frame.size.width) {
        cell.addressLab.frame=CGRectMake(20, cell.nameLab.frame.size.height+20, Screen_Width-40, 30);
    }else{
        cell.addressLab.frame=CGRectMake(20, cell.nameLab.frame.size.height+20, addressLabWdth, 30);
    }
    
    //
    if ([SA_model.SA_selected intValue]==1) {
        cell.selectLab.text=@"当前";
        cell.selectLab.hidden=NO;
    }else{
        cell.selectLab.text=@" ";
        cell.selectLab.hidden=YES;
    }
    cell.selectLab.frame=CGRectMake(cell.phoneLab.frame.origin.x+cell.phoneLab.frame.size.width+20, 10, 50, 30);
    
    [cell.editBtn addTarget:self action:@selector(editBtnTouched:) forControlEvents:UIControlEventTouchUpInside];
    cell.editBtn.tag=indexPath.row+20;
    [cell reloadInputViews];
    return cell;
}

#pragma mark ---- cell左右滑动
//左拉抽屉(删除和修改按钮)
- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *mutableArray=[self.SAArray copy];
    NSMutableArray * temArray = [NSMutableArray arrayWithArray:mutableArray];
    ShippingAddressModel *SA_model=temArray[indexPath.row];
    // 添加一个删除按钮
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除用户"handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        
        NSNumber *ID=SA_model.SA_Id;
        [temArray removeObjectAtIndex:indexPath.row];
        self.SAArray = [NSMutableArray arrayWithArray:temArray];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [[ContentMsgTool shareInstance]niceCourse_DeleteWithID:ID View:self.view];
    }];
    
    // 设为默认按钮
    UITableViewRowAction *editRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"设为默认"handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
//        NSInteger flag = 0;
        NSNumber *ID=SA_model.SA_Id;
        for (int  index=0; index<temArray.count; index++) {
            ShippingAddressModel *temp=temArray[index];
            if ([temp.SA_selected intValue]==1) {
                temp.SA_selected=0;
            }
            [[ContentMsgTool shareInstance]nicework_updateSelected:temp.SA_selected WithID:temp.SA_Id];
        }
        //开始正题
        [[ContentMsgTool shareInstance]nicework_updateSelected:@(1) WithID:ID];
        self.SAArray=nil;
        [[ContentMsgTool shareInstance]nicework_selectDataBaseWithView:self.view Result:^(NSArray *array) {
            self.SAArray=array;
        }];
        [self.tableView reloadData];
    }];
    
    editRowAction.backgroundColor = [UIColor blueColor];
    // 将设置好的按钮放到数组中返回
    return @[deleteRowAction, editRowAction];
}

-(void)editBtnTouched:(UIButton*)sender{
    
    ShippingAddressModel *SA_model=_SAArray[sender.tag-20];
    AddAddressTableViewController *addVC=[[AddAddressTableViewController alloc]init];
    addVC.type=@"edit";
    addVC.SA_model=SA_model;
    [self.navigationController pushViewController:addVC animated:YES];
}

-(void)back{
    [[ContentMsgTool shareInstance]nicework_closeDataBase];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)addAddress{
    
    AddAddressTableViewController *addVC=[[AddAddressTableViewController alloc]init];
    addVC.type=@"add";
    [self.navigationController pushViewController:addVC animated:YES];
}

-(UIFont*)InputFontWithType:(NSString*)type Size:(NSInteger)size{
    if ([type isEqualToString:@"system"]) {
        return [UIFont systemFontOfSize:size];
    }else{
        return [UIFont fontWithName:type size:size];
    }
}

@end
