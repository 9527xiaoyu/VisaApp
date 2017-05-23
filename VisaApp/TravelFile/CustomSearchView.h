//
//  CustomSearchView.h
//  TravelDemo
//
//  Created by yxy on 17/2/21.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomSearchViewDelegate <NSObject>

-(void)searchBeginEditing;
-(void)didSelectCancelBtn;
-(void)searchString:(NSString *)string;
@end


@interface CustomSearchView : UIView<UISearchBarDelegate>
@property (nonatomic,retain)UISearchBar *searchBar;
@property (nonatomic,retain)UIButton *cancelBtn;
@property (nonatomic,assign) id <CustomSearchViewDelegate>delegate;
@end

