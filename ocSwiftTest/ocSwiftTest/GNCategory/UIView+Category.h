//
//  UIView+Category.h
//  xwkt
//
//  Created by 菲律宾街头流浪汉 on 16/7/5.
//  Copyright © 2016年 菲律宾街头流浪汉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;

//获取该视图的控制器
- (UIViewController*) viewController;

//删除当前视图内的所有子视图
- (void) removeChildViews;

//删除tableview底部多余横线
- (void)setExtraCellLineHidden: (UITableView *)tableView;


@end
