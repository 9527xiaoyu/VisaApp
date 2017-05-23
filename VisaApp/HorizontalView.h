//
//  HorizontalView.h
//  CXTransparentNav
//
//  Created by yxy on 17/1/12.
//  Copyright © 2017年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HorizontalFlowLayout.h"
#import "HorizontalCollectionViewCell.h"

@class HorizontalView;
typedef void (^HViewBlock)(NSString *indepath);

@interface HorizontalView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *myCollectionView;
@property(nonatomic,strong)HorizontalFlowLayout *layout;
@property(nonatomic,strong)NSArray *titleArrs;
@property(nonatomic,assign)NSInteger items;

@property(nonatomic,strong)HViewBlock block;

-(void)createCollectionWithItms:(NSInteger)itms TitlesArrays:(NSArray*)titleArrs;

@end
