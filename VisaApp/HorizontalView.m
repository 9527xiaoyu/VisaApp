//
//  HorizontalView.m
//  CXTransparentNav
//
//  Created by yxy on 17/1/12.
//  Copyright © 2017年 CX. All rights reserved.
//

#import "HorizontalView.h"
#import "materialModel.h"
#import "HVTableViewCell.h"

#define myBounds [UIScreen mainScreen].bounds

@implementation HorizontalView
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
       
    }
    return self;
}

-(void)createCollectionWithItms:(NSInteger)itms TitlesArrays:(NSArray *)titleArrs{
    self.items=itms;
    self.titleArrs=titleArrs;
    
    self.layout = [[HorizontalFlowLayout alloc] init];
    
    CGRect rct = self.bounds;
    rct.size.height = 200;
    rct.origin.y = 0;
    
    self.myCollectionView = [[UICollectionView alloc] initWithFrame:rct collectionViewLayout:_layout];
    
    //数据源协议
    self.myCollectionView.delegate=self;
    self.myCollectionView.dataSource=self;
    
    self.myCollectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;//自动调整子控件与父控件宽高，保证距离不变
    self.myCollectionView.showsHorizontalScrollIndicator = NO;//隐藏水平滚动条
    self.myCollectionView.decelerationRate = UIScrollViewDecelerationRateNormal;//减速效果
    [self.myCollectionView setTranslatesAutoresizingMaskIntoConstraints:NO];//自动布局
    [self.myCollectionView registerClass:[HorizontalCollectionViewCell class] forCellWithReuseIdentifier:@"horizontalCell"];
    [self.myCollectionView setBackgroundColor:[UIColor clearColor]];
    [self.myCollectionView setDelegate:self];
    [self.myCollectionView setDataSource:self];
    
    [self addSubview:self.myCollectionView];
    
    [[[[UIApplication sharedApplication]delegate]window]addSubview:self];
    self.frame = CGRectMake(0, 0, myBounds.size.width, 170);
}

#pragma mark -- collectionView Delegate和DataSource协议
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _items;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HorizontalCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"horizontalCell" forIndexPath:indexPath];
    materialModel *model=_titleArrs[indexPath.row];
    cell.image.image = [UIImage imageNamed:model.image];
    cell.name.text = model.title;

    return cell;
}

#pragma mark 实现 CollectionViewFlowLayoutDelegate 的代理方法

- (CGSize)collectionView:(nonnull UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    return CGSizeMake(64, collectionView.bounds.size.height);
}

//Asks the delegate for the margins to apply to content in the specified section.安排初始位置
//使前后项都能居中显示
- (UIEdgeInsets)collectionView:(nonnull UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    NSInteger itemCount = [self collectionView:collectionView numberOfItemsInSection:section];
    
    NSIndexPath *firstIndexPath = [NSIndexPath indexPathForItem:0 inSection:section];
    CGSize firstSize = [self collectionView:collectionView layout:collectionViewLayout sizeForItemAtIndexPath:firstIndexPath];
    
    NSIndexPath *lastIndexPath = [NSIndexPath indexPathForItem:itemCount - 1 inSection:section];
    CGSize lastSize = [self collectionView:collectionView layout:collectionViewLayout sizeForItemAtIndexPath:lastIndexPath];
    
    return UIEdgeInsetsMake(0, (collectionView.bounds.size.width - firstSize.width) / 2,
                            0, (collectionView.bounds.size.width - lastSize.width) / 2);
    
    
}

#pragma mark --添加一个点击cell事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.myCollectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionNone];
    //滚动到中间
    [self.myCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    materialModel *model=_titleArrs[indexPath.row];
    NSString *str=[NSString stringWithFormat:@"%@",model.title];
    [[NSNotificationCenter defaultCenter]postNotificationName:str object:nil userInfo:@{@"chicked":str}];
}



@end
