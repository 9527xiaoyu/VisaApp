//
//  CTypeView.m
//  TravelDemo
//
//  Created by yxy on 17/2/20.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "CTypeView.h"
#import "paritiesTypeModel.h"

@interface CTypeView()<ZFDropDownDelegate>

@property (nonatomic, strong) NSArray * dataSource;

@property (nonatomic, strong) ZFDropDown * dropDown;
@property (nonatomic, strong) paritiesTypeModel *model;
@property (nonatomic, strong) UIView * backgroundView;
@property (nonatomic, strong) UIButton * button;
@property (nonatomic, strong) UILabel * label;

@end

@implementation CTypeView

+(instancetype)CTypeViewWithFrame:(CGRect)frame Array:(NSArray *)dataSource Result:(CTypeViewBlock)block{
    CTypeView *CTV=[[CTypeView alloc]initWithFrame:frame Array:dataSource];
    CTV.block=block;
    return CTV;
}

-(instancetype)initWithFrame:(CGRect)frame Array:(NSArray*)dataSource{
    if (self=[super initWithFrame:frame]) {
        _dataSource=dataSource;
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    CGFloat width = 130;
    CGFloat height = 40;
    
    self.dropDown = [[ZFDropDown alloc] initWithFrame:CGRectMake(0, 0, width, height) pattern:kDropDownPatternCustom];
    self.dropDown.delegate = self;
    self.dropDown.borderStyle = kDropDownTopicBorderStyleRect;
    [self addSubview:self.dropDown];
    
    
    //获取通知中心单例对象
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    //添加当前类对象为一个观察者，name和object设置为nil，表示接收一切通知
    [center addObserver:self selector:@selector(notice:) name:@"tapAction" object:nil];
}

-(void)notice:(id)sender{
    NSDictionary *dict=[sender userInfo];
    if ([[dict objectForKey:@"tapAction"]  isEqualToString:@"Yes"]) {
        [self.dropDown resignDropDownResponder];
    }
}

#pragma mark - ZFDropDownDelegate

- (NSArray *)itemArrayInDropDown:(ZFDropDown *)dropDown{
    for (int index=0; index<_dataSource.count; index++) {
        _model=_dataSource[index];
        
    }
    return self.dataSource;
}

- (UIView *)viewForTopicInDropDown:(ZFDropDown *)dropDown{
    self.backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(0, 0, 130, 40);
    self.button.backgroundColor=[UIColor greenColor];
    self.button.titleLabel.font=[UIFont systemFontOfSize:20];
    self.button.titleLabel.textAlignment=NSTextAlignmentCenter;
    [self.button setTitle:@"选择货币类型" forState:UIControlStateNormal];
    [self.button setTitleColor:ZFSystemBlue forState:UIControlStateNormal];
    self.button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //注意这里的target是dropDown, 不是self
    [self.button addTarget:dropDown action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    [self.backgroundView addSubview:self.button];
    
    return self.backgroundView;
}

- (UITableViewCell *)dropDown:(ZFDropDown *)dropDown tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIndentifier = @"MyTableViewCell";
    CurrencyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    
    if (!cell) {
        cell = [[CurrencyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    _model=_dataSource[indexPath.row];
    cell.txtLabel.text = _model.name;
    cell.subTxtLabel.text = _model.code;
    cell.backgroundColor = ZFTaupe3;
    return cell;
}

- (void)dropDown:(ZFDropDown *)dropDown didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _model=_dataSource[indexPath.row];
    [self.button setTitle:_model.name forState:UIControlStateNormal];
    if (_block) {
        _block(_model.code);
    }
}

-(void)dealloc{
    //移除观察者 self
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"tapAction" object:nil];
    
}

@end
