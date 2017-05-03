//
//  UITableView+Category.h
//  xwkt
//
//  Created by 菲律宾街头流浪汉 on 16/7/5.
//  Copyright © 2016年 菲律宾街头流浪汉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Category)

+ (instancetype)tableView;
+ (instancetype)groupTableView;

- (void)scrollToBottom;

@end
