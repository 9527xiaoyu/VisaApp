//
//  SetupSubViewController.m
//  MyStretchHeader
//
//  Created by yxy on 17/3/10.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "SetupSubViewController.h"

#define Screen_Bounds [UIScreen mainScreen].bounds.size
@interface SetupSubViewController ()

@end

@implementation SetupSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    UIBarButtonItem *leftBtn=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem=leftBtn;
    
    switch (_rowNumber) {
        case 0:
            [self InitAboutUs];
            break;
        case 1:
            [self InitQualification];
            break;
        case 2:
            [self InitPolicy];
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)InitAboutUs{
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(Screen_Bounds.width/2-150, Screen_Bounds.height/2-20, 300, 40)];
    lab.text=@"杨晓宇毕业设计成果";
    lab.textColor=[UIColor blackColor];
    lab.textAlignment=NSTextAlignmentCenter;
    lab.font=[UIFont systemFontOfSize:20];
    [self.view addSubview:lab];
}

-(void)InitQualification{
    UIImageView *qualificationImg=[[UIImageView alloc]initWithFrame:CGRectMake(50, 70, Screen_Bounds.width-100, Screen_Bounds.height-140)];
    qualificationImg.image=[UIImage imageNamed:@"placeholder"];
    [self.view addSubview:qualificationImg];
}

-(void)InitPolicy{
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(Screen_Bounds.width/2-150, Screen_Bounds.height/2-20, 300, 40)];
    lab.text=@"杨晓宇毕业设计成果";
    lab.textColor=[UIColor blackColor];
    lab.textAlignment=NSTextAlignmentCenter;
    lab.font=[UIFont systemFontOfSize:20];
    [self.view addSubview:lab];
}
@end
