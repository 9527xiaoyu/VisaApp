//
//  DealFinalTableViewController.m
//  orderDemo
//
//  Created by yxy on 17/4/21.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "DealFinalTableViewController.h"
#import "TimelineCellTableViewCell.h"
#import "MyTimelineCell.h"

@interface DealFinalTableViewController ()
@property(strong,nonatomic)UIView *topLine;
@property(strong,nonatomic)UIView *bottomLine;

@property(assign,nonatomic)CGFloat leadingSpaceOfLines;

@property(strong,nonatomic)NSArray *dataArray;
@end

@implementation DealFinalTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self.tableView registerNib:[UINib nibWithNibName:@"TimelineCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[MyTimelineCell class] forCellReuseIdentifier:@"cell"];
    
    UIBarButtonItem *rightBtn=[[UIBarButtonItem alloc]initWithTitle:@"ADD" style:UIBarButtonItemStylePlain target:self action:@selector(addOneCell)];
    self.navigationItem.rightBarButtonItem=rightBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addOneCell{
    //插入一行cell
    NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [indexPaths addObject: indexPath];
    //这个位置应该在修改tableView之前将数据源先进行修改,否则会崩溃........必须向tableView的数据源数组中相应的添加一条数据
    NSMutableArray *tempMutableArray=[[NSMutableArray alloc]initWithArray:self.dataArray];//将静态数组转化成动态数组
    [tempMutableArray insertObject:@"babababab" atIndex:0];//在动态数组第一个位置插入一条数据
    self.dataArray=[tempMutableArray copy];//动态数组转会静态
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationLeft];
    [self.tableView endUpdates];
    [self.tableView reloadData];
}

- (NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = @[@"you know ,this is timeline(时间轴)!"/*,@"灵感来源于：美团的订单详情页面 和 path软件",@"这只是个简单的实现，当然，你可以做的更丰富，左侧加头像或者其他...",@"初衷：工作项目需要，该死的老板一次次的改想法,当然，也要感谢他逼着成长",@"实现：感谢一个叫：Cyandev的作者，他的文章是我实现的源泉",@"我喜欢开源，对于一个正在成长的编程者，它帮助我太多了",@"这个时间轴分享给大家，贡献不论大小，也是一种贡献吧"*/];
    }
    return _dataArray;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
//    TimelineCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    MyTimelineCell *cell=[[MyTimelineCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    cell.lineLabel.text = _dataArray[indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.backgroundColor = [UIColor clearColor];
    //根据cell判断cell中bottomLine的颜色，如果不是最后一个，则颜色和topLine颜色一样。
    cell.buttomLine.backgroundColor = indexPath.row == (_dataArray.count-1) ? [UIColor grayColor] : [UIColor grayColor];
    
    cell.topLine.backgroundColor = indexPath.row == 0 ?  [UIColor clearColor] : [UIColor grayColor];
    cell.lineLabel.textColor=cell.timeLabel.textColor=indexPath.row == 0 ? [UIColor colorWithRed:0 green:0.7 blue:0 alpha:1]:[UIColor grayColor];
    //获取cell中topLine 或者bottomLine 的 x 位置。
    /**
     *   将像素point由point所在视图转换到目标视图view中，返回在目标视图view中的像素值
     *   (CGPoint)convertPoint:(CGPoint)point toView:(UIView *)view
     */
    self.leadingSpaceOfLines =  [cell convertPoint:cell.topLine.frame.origin toView:self.view].x;
    
    [self scrollViewDidScroll:tableView];
    
    return cell;
}
#pragma mark --tableViewDelegate--
//要展开cell视图回调; 行将显示的时候调用，预加载行
//- (void)tableView:(UITableView *)tableView willDisplayCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{

//  /**未实现，出现问题为：无法获取cell中topLine 或者bottomLine 的 x 位置。，如果你能找到解决方法，记得留言告诉我。或者邮件：name_guohua@163.com，将会非常感谢 */
//   /**以下方法已移至 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 方法中实现。*/

//    if (cell) {
//        self.topLine.backgroundColor = _cell.topLine.backgroundColor;
//        NSLog(@"color == %@",self.topLine.backgroundColor);
//        self.leadingSpaceOfLines = 28.f; //[self.timelineCell convertPoint:self.timelineCell.buttomLine.frame.origin toView:self.tableView].x;
//        NSLog(@"xxxxx = %.2f",self.leadingSpaceOfLines);
//   }
//
//    [self scrollViewDidScroll:tableView];
//
//}
#pragma mark --important code--
//根据上下拉动，动态改变 topLine 和 bottomLine 的 y 轴坐标。
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _topLine.frame = CGRectMake(_leadingSpaceOfLines, 0, 3, -scrollView.contentOffset.y);
    
    CGFloat yOffSet = scrollView.frame.size.height - scrollView.contentSize.height + scrollView.contentOffset.y ;
//    NSLog(@"%f,%f,%f,%f,%f",scrollView.frame.size.height,scrollView.contentSize.height,scrollView.contentOffset.y,yOffSet,self.view.frame.size.height);
    _bottomLine.frame = CGRectMake(_leadingSpaceOfLines, self.view.frame.size.height - yOffSet, 3, self.view.frame.size.height);
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
