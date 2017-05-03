//
//  GNSegment.h
//  GNSegmentControlTest
//
//  Created by 王锦涛 on 2017/3/9.
//  Copyright © 2017年 JTWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GNSegment : UIView

@property (nonatomic,assign)NSInteger selectedIndex;

- (void)addTarget:(id)target Action:(SEL)action;
@end
