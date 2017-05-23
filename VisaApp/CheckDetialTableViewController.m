//
//  CheckDetialTableViewController.m
//  CXTransparentNav
//
//  Created by yxy on 17/1/14.
//  Copyright © 2017年 CX. All rights reserved.
//

#import "CheckDetialTableViewController.h"
#import "contentListModel.h"
#import "UILabel+LabelHeightAndWidth.h"

#define Screen_width [UIScreen mainScreen].bounds.size.width
#define Screen_height [UIScreen mainScreen].bounds.size.height
@interface CheckDetialTableViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIView *view_bar;
    UITableView *mainTableView;
    UIButton *sendEmailBtn;
}

@property(nonatomic,assign)CGFloat RowHeight;

@end

@implementation CheckDetialTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    if (_backRow==0) {
        _backRow=7;
    }
    [self NavigationBa];
    [self setMainTableView];
    [self setSendButton];
}
/**
 *
 *初始化TableView
 *
 **/
-(void)setMainTableView{
    mainTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-60) style:UITableViewStylePlain];
    [mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    mainTableView.translatesAutoresizingMaskIntoConstraints=NO;//要实现自动布局，必须把该属性设置为no
    mainTableView.separatorStyle=UITableViewCellSeparatorStyleNone;//隐藏分割线
    mainTableView.delegate=self;
    mainTableView.dataSource=self;
    [self.view addSubview:mainTableView];
}
/**
 *
 *底部button，发送邮箱
 *
 **/
-(void)setSendButton{
    sendEmailBtn=[[UIButton alloc]initWithFrame:CGRectMake(20, Screen_height-60, Screen_width-40, 50)];
    [sendEmailBtn setTitle:@"发送至邮箱" forState:UIControlStateNormal];
    [sendEmailBtn setTitleColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1] forState:UIControlStateNormal];
    [sendEmailBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    sendEmailBtn.backgroundColor=[UIColor  colorWithRed:0.6 green:0 blue:0 alpha:1];
    //按钮边框
    [sendEmailBtn.layer setMasksToBounds:YES];//设置按钮的圆角半径不会被遮挡
    [sendEmailBtn.layer setCornerRadius:10];//圆角半径
    [sendEmailBtn.layer setBorderWidth:1];//设置边界宽度
    //设置边界颜色
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGColorRef color = CGColorCreate(colorSpaceRef, (CGFloat[]){0.8,0,0,01});
    [sendEmailBtn.layer setBorderColor:color];
    [sendEmailBtn addTarget:self action:@selector(sendBtnTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendEmailBtn];
}
/**
 *  自定义Nav
 *
 *  @return UIView
 */
-(UIView*)NavigationBa
{
    view_bar =[[UIView alloc]init];
    if ([[[UIDevice currentDevice]systemVersion]floatValue]>6.1)//获取设备系统版本信息
    {
        view_bar .frame=CGRectMake(0, 0, self.view.frame.size.width, 44+20);
        
    }else{
        view_bar .frame=CGRectMake(0, 0, self.view.frame.size.width, 44);
    }
    view_bar.backgroundColor=[UIColor clearColor];
    [self.view addSubview: view_bar];
    
    
    UILabel *title_label=[[UILabel alloc]initWithFrame:CGRectMake(65, view_bar.frame.size.height-44, self.view.frame.size.width-130, 44)];
    title_label.text=@"查看详情";
    title_label.font=[UIFont boldSystemFontOfSize:17];
    title_label.backgroundColor=[UIColor clearColor];
    title_label.textColor =[UIColor blackColor];
    title_label.textAlignment=1;
    [view_bar addSubview:title_label];
    
    
    UIButton* closeBtn=[[UIButton alloc]initWithFrame:CGRectMake(10, view_bar.frame.size.height-34, 25, 25)];
    [closeBtn setBackgroundImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [closeBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeBtnTouched) forControlEvents:UIControlEventTouchUpInside];
    [view_bar addSubview:closeBtn];
    
    return view_bar;
}

#pragma mark ---  按钮点击事件
-(void)closeBtnTouched{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)sendBtnTouched{
    NSLog(@"已发送");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 60;
}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_RowHeight) {
        return _RowHeight;
    }
    return 44;
}

//
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _backRow;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    contentListModel *model=_contentArray[indexPath.row+_backSum];
    
    UILabel *titleLab=[[UILabel alloc]init];
    titleLab.text=model.title;
    titleLab.textColor=[UIColor blackColor];
    titleLab.font=[UIFont systemFontOfSize:16];
    titleLab.numberOfLines=0;
    CGFloat titleLabHeight=[UILabel getHeightByWidth:titleLab.frame.size.width title:titleLab.text font:titleLab.font];
    titleLab.frame=CGRectMake(20, 5, Screen_width/2, titleLabHeight);
    
    UILabel *detialLab=[[UILabel alloc]init];
    detialLab.text=model.detial;
    detialLab.textColor=[UIColor lightGrayColor];
    detialLab.font=[UIFont systemFontOfSize:14];
    detialLab.numberOfLines=0;
    CGFloat detialLabHeight=[UILabel getHeightByWidth:detialLab.frame.size.width title:detialLab.text font:detialLab.font];
    detialLab.frame=CGRectMake(20, titleLabHeight+10, Screen_width-20, detialLabHeight);
    
    _RowHeight=titleLabHeight+detialLabHeight+20;
    
    [cell addSubview:titleLab];
    [cell addSubview:detialLab];
    
    return cell;
}

@end
