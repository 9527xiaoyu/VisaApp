//
//  BanLiView.m
//  myView
//
//  Created by yxy on 17/1/6.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "BanLiView.h"
#define myBounds [UIScreen mainScreen].bounds
@interface BanLiView()
@property (nonatomic,strong)UIView *bgView;    //屏幕下方看不到的view
@property(nonatomic,strong)UIButton *banliBtn;
@end

@implementation BanLiView

+(instancetype)BanLiViewWithBlock:(BanLiViewBlock)block{
    BanLiView *banli=[[BanLiView alloc]initWithFrame:myBounds];
    banli.callBlock=block;
    
    return banli;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self banli];
    }
    return self;
}

-(void)banli{
    _bgView=[[UIView alloc]initWithFrame:myBounds];
    _bgView.backgroundColor=[UIColor whiteColor];
//    _bgView.alpha=0.5;
    
    _banliBtn=[[UIButton alloc]initWithFrame:CGRectMake(myBounds.size.width/2-50 ,5 , 100, 40)];
    [_banliBtn setTitle:@"adsads" forState:UIControlStateNormal];
    [_banliBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_banliBtn setBackgroundColor:[UIColor redColor]];
    [self addSubview:_banliBtn];
    
    //self
    self.backgroundColor = [UIColor whiteColor];
    self.alpha=0.8;
    [self setFrame:CGRectMake(0, myBounds.size.height-100, myBounds.size.width, 50)];
    self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth;
    [[[[UIApplication sharedApplication] delegate] window] addSubview:self];
    [self setFrame: CGRectMake(0, myBounds.size.height,myBounds.size.width , 50)];
}

- (void)show
{
//    [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:0.7 options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionLayoutSubviews animations:^{
    
        [[[[UIApplication sharedApplication] delegate] window] addSubview:self];
        self.bgView.alpha = 1;
        
        self.frame = CGRectMake(0, myBounds.size.height-50, myBounds.size.width, 50);
    [self addSubview:_banliBtn];
//    } completion:NULL];
}

//- (void)dismissView
//{
//    [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:0.7 options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionLayoutSubviews animations:^{
//        self.bgView.alpha = 0;
//        self.frame = CGRectMake(0, myBounds.size.height,myBounds.size.width , 100);
//        
//    } completion:^(BOOL finished) {
//        [self.bgView removeFromSuperview];
//        [self removeFromSuperview];
//        
//        
//    }];
//}

@end
