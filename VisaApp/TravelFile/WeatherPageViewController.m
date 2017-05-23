//
//  WeatherPageViewController.m
//  TravelDemo
//
//  Created by yxy on 17/2/17.
//  Copyright © 2017年 yxy. All rights reserved.

//      天气

#import "WeatherPageViewController.h"
#import <ThinkpageAPI/TPSDK.h>
#import "TravelToolMsg.h"
#import "CityViewController.h"

#import "WeatherOfCityModel.h"
#import "WeatherHeaderView.h"
#import "CurrentDayWeatherView.h"
#import "forecastWeatherView.h"

#define  Width [UIScreen mainScreen].bounds.size.width
#define  Height self.view.frame.size.height

@interface WeatherPageViewController ()<UIScrollViewDelegate,CAAnimationDelegate>
{
    NSInteger page;
}
@property(nonatomic,strong)NSArray *cityWeatherArr;
@property(nonatomic,strong)WeatherOfCityModel *CWMod;

@property(nonatomic,strong)WeatherHeaderView *headerView;
@property(nonatomic,strong)CurrentDayWeatherView *curWeatherView;
@property(nonatomic,strong)forecastWeatherView *forecastWeatherView;
@property(nonatomic, strong)NSTimer *timer;
@property(nonatomic, strong)NSMutableArray *imageList;
@property(nonatomic,strong)UIScrollView *scrollView;

@property(nonatomic,strong)NSString *cityname;
@end

@implementation WeatherPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //使用心知天气官网获取的key和用户id初始化WeatherManager
//    TPWeatherManager *weatherManager = [[TPWeatherManager alloc]
//                                        initWithAccessCode:@"gafprverh3hrfcuq" userId:@"UD5F4F2FB2"];
//
//    [[TravelToolMsg shareInstance]Travel_CurrentWeatherOfCityWithManager:weatherManager CityName:@"beijing" Result:^(NSArray *WeatherArray) {
//        _CWMod=WeatherArray[0];
//        NSLog(@"---%@",_CWMod.text);
//    }];
    
    _imageList=[[NSMutableArray alloc] initWithObjects:@"show_image_1.png", @"show_image_2.png", @"show_image_3.png", @"show_image_4.png", nil];
    [self createGradientBackground:self.view.bounds with:[_imageList objectAtIndex:0]];
    page=1;
    [self createViews];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ---- 滚动背景图片
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

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (self.timer==nil) {//计时5S
        self.timer=[NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(switchImages) userInfo:nil repeats:YES];
    }
}

- (void)switchImages
{
    //
    // 3d_V
    //
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    transition.delegate = self;
    [self.view.layer addAnimation:transition forKey:@"EaseInOut"];
    
    NSString *imageUrl = [_imageList objectAtIndex:page];
    [self createGradientBackground:self.view.bounds with:imageUrl];
    page=(page+1)%_imageList.count;
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    if (_timer!=nil) {
        [_timer invalidate];
        _timer=nil;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat sheight=scrollView.contentOffset.y;
    NSLog(@"--%f",sheight);
    if(sheight>=0&&sheight<=260){
        CGFloat alpha=0.7f*sheight/260;
        _scrollView.backgroundColor=[UIColor colorWithWhite:0.0f alpha:alpha];
        _headerView.backgroundColor=[UIColor colorWithWhite:0.0f alpha:alpha];
    }else if (sheight>260){
        _scrollView.backgroundColor=[UIColor colorWithWhite:0.0f alpha:0.5f];
        _headerView.backgroundColor=[UIColor colorWithWhite:0.0f alpha:0.5f];
    }
}

#pragma mark ---- 创建天气视图 左下
- (void)createViews{
    if (_cityname==NULL) {
        _cityname=@"北京";
    }
    //地区天气
    _headerView=[WeatherHeaderView WeatherHeaderViewWithFrame:CGRectMake(0, 0, Width, 60) CityName:_cityname];
    _headerView.backgroundColor=[UIColor clearColor];
    [_headerView.searchBtn addTarget:self action:@selector(searchData) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_headerView];
    
    CGRect rect=self.view.bounds;
    rect.origin.y=60;
    rect.size.height-=60;
//    _scrollView.frame=rect;
    
    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 60, Width, Height)];
    //左下 显示气温
    TPWeatherManager *weatherManager = [[TPWeatherManager alloc]initWithAccessCode:@"gafprverh3hrfcuq" userId:@"UD5F4F2FB2"];
    _curWeatherView=[CurrentDayWeatherView CurrentDayWeatherViewWithFrame:CGRectMake(0, 0, Width, rect.size.height) Manager:weatherManager City:_cityname];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
    [_curWeatherView addGestureRecognizer:singleTap];
    [_scrollView addSubview:_curWeatherView];
    
     NSDate *currentDate = [NSDate date];//获取当前时间，日期
    _forecastWeatherView=[forecastWeatherView ForecastWeatherViewWithFrame:CGRectMake(30, _curWeatherView.frame.origin.y+_curWeatherView.frame.size.height-60, Width-60, 208) WeatherManager:weatherManager City:_cityname StartDay:currentDate Days:3];
    _forecastWeatherView.backgroundColor=[UIColor clearColor];
    [_scrollView addSubview:_forecastWeatherView];
    
    _scrollView.contentSize=CGSizeMake(Width, _forecastWeatherView.frame.origin.y+_forecastWeatherView.frame.size.height+300.0f);
    _scrollView.backgroundColor=[UIColor clearColor];
    _scrollView.showsVerticalScrollIndicator=NO;
    _scrollView.delegate=self;
    _scrollView.clipsToBounds=YES;
    [self.view addSubview:_scrollView];
}

#pragma mark ----  按钮点击事件
-(void)searchData{
    CityViewController *controller = [[CityViewController alloc] init];
    controller.currentCityString = @"北京";
    controller.selectString = ^(NSString *string){
        _cityname = string;
        
        [_headerView removeFromSuperview];
        [_curWeatherView removeFromSuperview];
        [_forecastWeatherView removeFromSuperview];
        [_scrollView removeFromSuperview];
        [self createViews];
        
    };
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)singleTapGestureCaptured:(id)sender{
    //点击事件：scrollView移动的距离
    CGRect rect=_scrollView.frame;
    if(_scrollView.contentOffset.y>0){
        rect.origin=CGPointMake(0, 0);
    }else{
        rect.origin=CGPointMake(0, Height-180);//y移动
    }
    [_scrollView scrollRectToVisible:rect animated:YES];
}

@end
