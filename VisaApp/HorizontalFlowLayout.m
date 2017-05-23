//
//  HorizontalFlowLayout.m
//  HorizontalScrolling
//
//  Created by yxy on 17/1/12.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "HorizontalFlowLayout.h"

@implementation HorizontalFlowLayout
static CGFloat const ActiveDistance = 40;
static CGFloat const ScaleFactor = 0.2;
- (instancetype)init
{
    if (self = [super init]) {
    }
    return self;
}


/**
 * 准备操作：一般在这里设置一些初始化参数
 */
- (void)prepareLayout
{
    // 必须要调用父类(父类也有一些准备操作)
    [super prepareLayout];
    
    // 设置滚动方向(只有流水布局才有这个属性)
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 设置cell的大小
    CGFloat itemWH = self.collectionView.frame.size.height * 0.8;
    self.itemSize = CGSizeMake(itemWH, itemWH);
    
    // 设置内边距
    CGFloat inset = (self.collectionView.frame.size.width - itemWH) * 0.5;
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    // 调用父类方法拿到默认的布局属性
    NSArray *array = [[NSArray alloc]initWithArray:[super layoutAttributesForElementsInRect:rect] copyItems:YES];
    
    CGRect visibleRect = (CGRect){self.collectionView.contentOffset, self.collectionView.bounds.size};
    
    for (int i=0;i<array.count;i++) {
        UICollectionViewLayoutAttributes *attributes=array[i];
        //如果cell在屏幕上则进行缩放
        if (CGRectIntersectsRect(attributes.frame, rect)) {
            
            attributes.alpha = 0.5;
            
            CGFloat distance = CGRectGetMidX(visibleRect) - attributes.center.x;//距离中点的距离
            CGFloat normalizedDistance = distance / ActiveDistance;
            
            if (ABS(distance) < ActiveDistance) {
                CGFloat zoom = 0.85 + ScaleFactor * (1 - ABS(normalizedDistance)); //放大渐变
                attributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0);
                attributes.zIndex = 1;
                attributes.alpha = 1.0;
                NSIndexPath *iPath=[NSIndexPath indexPathForRow:i inSection:0];
                [self.collectionView selectItemAtIndexPath:iPath animated:YES scrollPosition:UICollectionViewScrollPositionNone];
            }
        }
    }
    return array;
}

/**
 * 当uicollectionView的bounds发生改变时，是否要刷新布局
 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

/**
 * targetContentOffset ：通过修改后，collectionView最终的contentOffset(取决定情况)
 * proposedContentOffset ：默认情况下，collectionView最终的contentOffset
 * scroll 停止对中间位置进行偏移量校正
 */
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    // 计算最终的可见范围
    CGRect rect;
    rect.origin = proposedContentOffset;
    rect.size = self.collectionView.frame.size;
    
    // 取得cell的布局属性
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    // 计算collectionView最终中间的x
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    // 计算最小的间距值
    CGFloat minDetal = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attrs in array) {
        if (ABS(minDetal) > ABS(attrs.center.x - centerX)) {
            minDetal = attrs.center.x - centerX;
        }
    }
    
    // 在原有offset的基础上进行微调
    return CGPointMake(proposedContentOffset.x + minDetal, proposedContentOffset.y);
}

@end
