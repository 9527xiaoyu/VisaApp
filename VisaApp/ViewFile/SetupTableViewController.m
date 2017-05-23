//
//  SetupTableViewController.m
//  MyStretchHeader
//
//  Created by yxy on 17/3/10.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "SetupTableViewController.h"
#import "SetupSubViewController.h"

#define Screen_Bounds [UIScreen mainScreen].bounds
@interface SetupTableViewController ()
@property(nonatomic,strong)NSArray *setupArray;
@property(nonatomic,strong)UIButton *logDownBtn;
@property(nonatomic,strong)NSString *detail;
@end

@implementation SetupTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"设置";
    
    UIBarButtonItem *leftBtn=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem=leftBtn;
    
    self.setupArray=[NSArray arrayWithObjects:@"关于我们",@"经营资质",@"隐私政策",@"客服电话",@"版本号", nil];
    self.tableView=[[UITableView alloc]initWithFrame:Screen_Bounds style:UITableViewStyleGrouped];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle=UITableViewCellStyleValue2;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section==0){
        return 5;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
//    self.tableView.separatorStyle=UITableViewCellAccessoryDisclosureIndicator;
    cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    
    if (indexPath.section==0) {
        cell.textLabel.text=_setupArray[indexPath.row];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        if (indexPath.row==3) {
            cell.detailTextLabel.text=@"1008611";
            _detail=cell.detailTextLabel.text;
            return cell;
        }else if (indexPath.row==4){
            cell.accessoryType=UITableViewCellAccessoryNone;
            cell.detailTextLabel.text=@"V1.1.0";
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            return cell;
        }
        return cell;
    }
    _logDownBtn=[[UIButton alloc]initWithFrame:CGRectMake(Screen_Bounds.size.width/2-50, 10, 100, 30)];
    [_logDownBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [_logDownBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_logDownBtn addTarget:self action:@selector(logDownBtnTouched) forControlEvents:UIControlEventTouchUpInside];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    [cell addSubview:self.logDownBtn];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==0) {
        if (indexPath.row==4) {
            
        }else if (indexPath.row==3){
            NSString *phoneStr=[NSString stringWithFormat:@"%@", _detail];
            UIAlertController *alertController=[UIAlertController alertControllerWithTitle:phoneStr message:@"(周一至周日 09:30-16:30)" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"呼叫" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self callPhoneStr:phoneStr withVC:self];
            }];
            [alertController addAction:cancelAction];
            [alertController addAction:okAction];
            [self presentViewController:alertController animated:YES completion:nil];
        }else{
            SetupSubViewController *setupSubVC=[[SetupSubViewController alloc]init];
            setupSubVC.rowNumber=indexPath.row;
            [self.navigationController pushViewController:setupSubVC animated:YES];
        }
        
    }
    
}

- (void)callPhoneStr:(NSString*)phoneStr  withVC:(UIViewController *)selfvc{
    NSString *str2 = [[UIDevice currentDevice] systemVersion];
    
    if ([str2 compare:@"10.2" options:NSNumericSearch] == NSOrderedDescending || [str2 compare:@"10.2" options:NSNumericSearch] == NSOrderedSame)
    {
        NSLog(@">=10.2");
        NSString* PhoneStr = [NSString stringWithFormat:@"tel://%@",phoneStr];
        if ([PhoneStr hasPrefix:@"sms:"] || [PhoneStr hasPrefix:@"tel:"]) {
            UIApplication * app = [UIApplication sharedApplication];
            if ([app canOpenURL:[NSURL URLWithString:PhoneStr]]) {
                [app openURL:[NSURL URLWithString:PhoneStr]];
            }
        }
    }else {
        NSMutableString* str1 = [[NSMutableString alloc]initWithString:phoneStr];// 存在堆区，可变字符串
        if (phoneStr.length == 10) {
            [str1 insertString:@"-"atIndex:3];// 把一个字符串插入另一个字符串中的某一个位置
            [str1 insertString:@"-"atIndex:7];// 把一个字符串插入另一个字符串中的某一个位置
        }else {
            [str1 insertString:@"-"atIndex:3];// 把一个字符串插入另一个字符串中的某一个位置
            [str1 insertString:@"-"atIndex:8];// 把一个字符串插入另一个字符串中的某一个位置
        }
        NSString * str = [NSString stringWithFormat:@"是否拨打电话\n%@",str1];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:str message: nil preferredStyle:UIAlertControllerStyleAlert];
        // 设置popover指向的item
        alert.popoverPresentationController.barButtonItem = selfvc.navigationItem.leftBarButtonItem;
        // 添加按钮
        [alert addAction:[UIAlertAction actionWithTitle:@"呼叫" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            NSLog(@"点击了呼叫按钮10.2下");
            NSString* PhoneStr = [NSString stringWithFormat:@"tel://%@",phoneStr];
            if ([PhoneStr hasPrefix:@"sms:"] || [PhoneStr hasPrefix:@"tel:"]) {
                UIApplication * app = [UIApplication sharedApplication];
                if ([app canOpenURL:[NSURL URLWithString:PhoneStr]]) {
                    [app openURL:[NSURL URLWithString:PhoneStr]];
                }
            }
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            NSLog(@"点击了取消按钮");
        }]];
        [selfvc presentViewController:alert animated:YES completion:nil];
    }
    
}

-(void)logDownBtnTouched{
    
}

@end
