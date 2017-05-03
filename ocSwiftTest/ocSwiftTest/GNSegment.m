//
//  GNSegment.m
//  GNSegmentControlTest
//
//  Created by 王锦涛 on 2017/3/9.
//  Copyright © 2017年 JTWang. All rights reserved.
//

#import "GNSegment.h"
#import "GNSegmentButton.h"

@interface GNSegment()

@property (nonatomic,weak)GNSegmentButton *one;
@property (nonatomic,weak)GNSegmentButton *two;

@end
@implementation GNSegment

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    GNSegmentButton *one = [GNSegmentButton buttonWithType:UIButtonTypeCustom];
    one.titleLabel.font = [UIFont systemFontOfSize:15];
    [one setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [one setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [one setTitle:@"我的笔记" forState:UIControlStateNormal];
    [one setTitle:@"我的笔记" forState:UIControlStateSelected];
    
    CGRect frame = self.bounds;
    frame.size.width =  frame.size.width * 0.5;
    one.frame = frame;
    one.tag = 0;
    [self addSubview:one];
    _one = one;
    
    GNSegmentButton *two = [GNSegmentButton buttonWithType:UIButtonTypeCustom];
    two.titleLabel.font = [UIFont systemFontOfSize:15];
    [two setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [two setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [two setTitle:@"老师注释" forState:UIControlStateNormal];
    [two setTitle:@"老师注释" forState:UIControlStateSelected];
    two.frame = CGRectMake(frame.size.width, 0, frame.size.width, frame.size.height);
    two.tag = 1;
    [self addSubview:two];
    _two = two;
}

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    _selectedIndex = selectedIndex;
    if (selectedIndex == 0) {
        self.one.selected = YES;
        self.two.selected = NO;
    }else{
        self.one.selected = NO;
        self.two.selected = YES;
    }
}

- (void)addTarget:(id)target Action:(SEL)action
{
    [self.one addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [self.two addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}


@end
