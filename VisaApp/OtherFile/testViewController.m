//
//  testViewController.m
//  loginView
//
//  Created by 速度哇 on 2016/12/7.
//  Copyright © 2016年 速度哇. All rights reserved.
//

#import "testViewController.h"

#define myBounds [UIScreen mainScreen].bounds
@interface testViewController ()
//@property(nonatomic,strong)UIView *line;
@property(nonatomic,strong)UITextField *iPhoneNumber;
@property(nonatomic,strong)UITextField *password;

@property(nonatomic,strong)UIButton* goBtn;
@property(nonatomic,strong)UIButton* forgotBtn;
@property(nonatomic,strong)UIButton* registeredBtn;

@end

@implementation testViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.iPhoneNumber];
    [self.view addSubview:self.password];
    [self.view addSubview:self.goBtn];
    [self.view addSubview:self.forgotBtn];
    [self.view addSubview:self.registeredBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITextField *)iPhoneNumber{
    if (!_iPhoneNumber) {
        _iPhoneNumber=[[UITextField alloc]initWithFrame:CGRectMake(myBounds.size.width/10, myBounds.size.height/6, myBounds.size.width-myBounds.size.width/5, 40)];
        _iPhoneNumber.placeholder=@"输入手机号码";
        [_iPhoneNumber.layer setCornerRadius:5];
        UIView *line=[[UIView alloc]initWithFrame:CGRectMake(0, self.iPhoneNumber.frame.size.height-2, self.iPhoneNumber.frame.size.width, 1)];
        line.backgroundColor=[UIColor lightGrayColor];
        [_iPhoneNumber addSubview:line];
    }
    return _iPhoneNumber;
}

-(UITextField *)password{
    if (!_password) {
        _password=[[UITextField alloc]initWithFrame:CGRectMake(myBounds.size.width/10, myBounds.size.height/6+50, myBounds.size.width-myBounds.size.width/5, 40)];
        _password.placeholder=@"输入密码";
        [_password.layer setCornerRadius:5];
        UIView *line=[[UIView alloc]initWithFrame:CGRectMake(0, self.password.frame.size.height-2, self.password.frame.size.width, 1)];
        line.backgroundColor=[UIColor lightGrayColor];
        [_password addSubview:line];
    }
    return _password;
}

-(UIButton *)goBtn{
    if (!_goBtn) {
        _goBtn=[[UIButton alloc]initWithFrame:CGRectMake(myBounds.size.width/10+10, myBounds.size.height/2-20, myBounds.size.width-myBounds.size.width/5-20, 40)];
        _goBtn.backgroundColor=[UIColor redColor];
        [_goBtn setTitle:@"登录" forState:UIControlStateNormal];
//        [_goBtn addTarget:self action:@selector(goBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _goBtn;
}

-(UIButton *)forgotBtn{
    if (!_forgotBtn) {
        _forgotBtn=[[UIButton alloc]initWithFrame:CGRectMake(myBounds.size.width/4, myBounds.size.height-260,50 , 30)];
        NSLog(@"%f",myBounds.size.width/2);
        [_forgotBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgotBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_forgotBtn.titleLabel setFont:[UIFont systemFontOfSize:10]];
//        [_forgotBtn addTarget:self action:@selector(forgotBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgotBtn;
}

-(UIButton *)registeredBtn{
    if (!_registeredBtn) {
        _registeredBtn=[[UIButton alloc]initWithFrame:CGRectMake(myBounds.size.width-myBounds.size.width/4-50, myBounds.size.height-260, 50, 30)];
        [_registeredBtn setTitle:@"注册账号" forState:UIControlStateNormal];
        [_registeredBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_registeredBtn.titleLabel setFont:[UIFont systemFontOfSize:10]];
//        [_registeredBtn addTarget:self action:@selector(registeredBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registeredBtn;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
