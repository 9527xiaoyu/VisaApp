//
//  TravelViewController.m
//  TravelDemo
//
//  Created by yxy on 17/2/17.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "TravelViewController.h"
#import "WeatherPageViewController.h"
#import "ParitiesPageViewController.h"
#import "NavTitleView.h"

#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height

@interface TravelViewController ()
/**
 *  顶部分栏控制器视图
 */
@property (nonatomic, strong) NavTitleView * topTitleView;

@property (nonatomic,weak) UIViewController *currentViewController;
@property (nonatomic,strong) WeatherPageViewController *weatherPageVC;
@property (nonatomic,strong) ParitiesPageViewController *paritiesPageVC;
@end

@implementation TravelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTitleView];
    [self createViewManagement];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -  导航栏相关
- (void)setNavigation {
    
    //显示导航栏
    self.navigationController.navigationBar.hidden = NO;
}

#pragma mark -创建Navigation中的titleView
- (void)createTitleView{
    
    self.topTitleView =[NavTitleView TitleViewWithBlock:^(UIButton *btn) {
        if((self.currentViewController == _weatherPageVC && btn.tag == 10) || (self.currentViewController == _paritiesPageVC && btn.tag == 20)){
            return ;
        }else{
            if (btn.tag == 10) {
                
                [self replaceController:self.currentViewController newController:_weatherPageVC];
            }else{
                [self replaceController:self.currentViewController newController:_paritiesPageVC];
            }
        }
    }];
    
    [self.view addSubview:self.topTitleView];
}

#pragma mark -创建视图管理
- (void)createViewManagement{
    
    _weatherPageVC = [[WeatherPageViewController alloc] init];
    _weatherPageVC.view.frame = CGRectMake(0, 64, Width, Height);
    [self addChildViewController:_weatherPageVC];
    
    _paritiesPageVC = [[ParitiesPageViewController alloc] init];
    _paritiesPageVC.view.frame = CGRectMake(0, 64, Width, Height );
    [self addChildViewController:_paritiesPageVC];
    
    [self.view addSubview:_weatherPageVC.view];
    self.currentViewController = self.weatherPageVC;
}

#pragma mark -视图切换方法
- (void)replaceController:(UIViewController *)oldController newController:(UIViewController *)newController{
    
    [self addChildViewController:newController];
    [self transitionFromViewController:oldController toViewController:newController duration:2.0 options:UIViewAnimationOptionCurveLinear animations:nil completion:^(BOOL finished) {
        
        if (finished) {
            [newController didMoveToParentViewController:self];
            [oldController willMoveToParentViewController:nil];
            [oldController removeFromParentViewController];
            self.currentViewController = newController;
            
        }else{
            
            self.currentViewController = oldController;
        }
    }];
    
}

@end
