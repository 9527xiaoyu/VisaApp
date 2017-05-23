//
//  ParitiesPageViewController.m
//  TravelDemo
//
//  Created by yxy on 17/2/17.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "ParitiesPageViewController.h"
#import "TravelToolMsg.h"
#import "CTypeView.h"
#import "ZNKeyboard.h"
#import "RealTimeCurrencyModel.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ParitiesPageViewController ()

@property(nonatomic,strong)UIButton *BeginSumBtn;
@property(nonatomic,strong)UIButton *exchangeBtn;
/*
 *输入所持货币金额
 */
@property(nonatomic,strong)UITextField *InputTF;
/*
 *货币类型列表
 */
@property (nonatomic, strong) ZFTapGestureRecognizer * tap;
@property (nonatomic, strong) NSString* FromStr;
@property (nonatomic, strong) NSString* ToStr;
@property (nonatomic, strong) NSString* InputStr;

@property (nonatomic, strong) UILabel *ResultLab;
@end

@implementation ParitiesPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = 130;
    CGFloat height = HEIGHT/2;
    CGFloat yPos = 100;
    
    
    [[TravelToolMsg shareInstance]CurrencylistWithResult:^(NSArray *CurrencyTypeArr) {
        
        UIView *CTV1=[CTypeView CTypeViewWithFrame:CGRectMake(WIDTH/2-160, yPos, width, height)  Array:CurrencyTypeArr Result:^(NSString *choseStr) {
            _FromStr=choseStr;
        }];
        
        CGFloat CTV1_Width=CTV1.frame.size.width-20;
        
        UILabel *HasLab=[[UILabel alloc]initWithFrame:CGRectMake(10, 50, CTV1_Width, 40)];
        HasLab.text=@"持有金额";
        HasLab.font=[UIFont systemFontOfSize:18];
        HasLab.textColor=[UIColor blackColor];
        [CTV1 addSubview:HasLab];
        
        _InputTF=[[UITextField alloc]initWithFrame:CGRectMake(10, 100, CTV1_Width, 40)];
        _InputTF.placeholder=@"输入金额";
        _InputTF.borderStyle=UITextBorderStyleRoundedRect;
        _InputTF.layer.borderWidth=1;
        CGColorSpaceRef colSpace=CGColorSpaceCreateDeviceRGB();
        CGColorRef colref = CGColorCreate(colSpace,(CGFloat[]){ 177/255, 177/255, 177/255, 1 });//颜色
        _InputTF.layer.borderColor=colref;
        //纯数字键盘使用
        //1,创建对象
        ZNKeyboard *keyboard = [ZNKeyboard keyboardWithTextField:_InputTF Result:^(NSString *value) {
            _InputStr=value;
        }];
         self.InputTF.inputView = keyboard;
        [CTV1 addSubview:_InputTF];
        
        ///////
        ///////
        UIView *CTV2=[CTypeView CTypeViewWithFrame:CGRectMake(WIDTH/2+30, yPos, width, height)  Array:CurrencyTypeArr Result:^(NSString *choseStr) {
            _ToStr=choseStr;
        }];
        
        CGFloat CTV2_Width=CTV2.frame.size.width-20;
        UILabel *GetLab=[[UILabel alloc]initWithFrame:CGRectMake(10, 50, CTV2_Width, 40)];
        GetLab.text=@"兑换金额";
        GetLab.font=[UIFont systemFontOfSize:18];
        GetLab.textColor=[UIColor blackColor];
        [CTV2 addSubview:GetLab];
        
        _ResultLab=[[UILabel alloc]initWithFrame:CGRectMake(10, 100, CTV2_Width, 40)];
        _ResultLab.text=@"0";
        _ResultLab.font=[UIFont systemFontOfSize:18];
        _ResultLab.textColor=[UIColor redColor];
        [CTV2 addSubview:_ResultLab];

        [self.view addSubview:CTV1];
        [self.view addSubview:CTV2];
    }];
    
    //设置背景图片
    [self createGradientBackground:self.view.bounds with:@"YD"];
    //
    _exchangeBtn=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH/2-15, 205, 30, 30)];
    [_exchangeBtn setImage:[UIImage imageNamed:@"exchange"] forState:UIControlStateNormal];
    [self.view addSubview:_exchangeBtn];
    //
    _BeginSumBtn=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH/2-60, HEIGHT/2+150, 120, 40)];
    [_BeginSumBtn setTitle:@"查询" forState:UIControlStateNormal];
    [_BeginSumBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_BeginSumBtn.titleLabel setFont:[UIFont systemFontOfSize:25]];
    [_BeginSumBtn.layer setMasksToBounds:YES];
    _BeginSumBtn.layer.cornerRadius=6;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 0, 0, 1 });//颜色
    _BeginSumBtn.layer.borderColor=colorref;
    _BeginSumBtn.layer.borderWidth=1;
    [_BeginSumBtn setBackgroundColor:[UIColor colorWithRed:1 green:0 blue:0 alpha:0.9]];
    [_BeginSumBtn addTarget:self action:@selector(BeginSum) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_BeginSumBtn];
    
    self.tap = [[ZFTapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self.view addGestureRecognizer:self.tap];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createGradientBackground:(CGRect)rect with:(NSString*)bgurl{
    //Image background
    UIImage *bgImage=[UIImage imageNamed:bgurl];
    CGSize bgSize=bgImage.size;
    CGRect imageRect;
    if ((bgSize.width/bgSize.height)>(rect.size.width/rect.size.height)) {
        imageRect=CGRectMake(0, 0, rect.size.height*bgImage.size.width/bgImage.size.height, rect.size.height);
    }else{
        imageRect=CGRectMake(0, 0, rect.size.width,rect.size.width*bgImage.size.height/bgImage.size.width);
    }
    
    UIGraphicsBeginImageContext(imageRect.size);
    [bgImage drawInRect:imageRect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
}

#pragma mark ---- 查询按钮点击事件
-(void)BeginSum{
    [[TravelToolMsg shareInstance]RealTimeCurrencyWithFrom:_FromStr To:_ToStr Result:^(NSArray *RealTimeCurrencyArr) {
        RealTimeCurrencyModel *model=RealTimeCurrencyArr[0];
        _ResultLab.text=[NSString stringWithFormat:@"%.2f %@",[_InputTF.text doubleValue]*[model.currencyFD doubleValue] *[model.exchange doubleValue],model.currencyT_Name];

        [self.view reloadInputViews];
    }];
}

/**
 *  self.view添加手势取消dropDown第一响应
 */
- (void)tapAction{
    [_InputTF resignFirstResponder];
    //创建一个消息对象
    NSNotification * notice = [NSNotification notificationWithName:@"tapAction" object:nil userInfo:@{@"tapAction":@"Yes"}];
    //发送消息
    [[NSNotificationCenter defaultCenter]postNotification:notice];
}


@end
