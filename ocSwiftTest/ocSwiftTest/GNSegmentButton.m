//
//  GNSegmentButton.m
//  GNSegmentControlTest
//
//  Created by 王锦涛 on 2017/3/9.
//  Copyright © 2017年 JTWang. All rights reserved.
//

#import "GNSegmentButton.h"

@implementation GNSegmentButton


- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    if (selected) {
        self.backgroundColor = [UIColor blueColor];
    }else{
        self.backgroundColor = [UIColor grayColor];
    }
}

- (void)setHighlighted:(BOOL)highlighted{
    
}
@end
