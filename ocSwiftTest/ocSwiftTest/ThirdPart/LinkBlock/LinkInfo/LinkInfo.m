//
//  LinkInfo.m
//  LinkBlockProgram
//
//  Created by NOVO on 16/7/12.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation LinkInfo
- (instancetype)init
{
    self = [super init];
    if (self) {
        _throwCount=0;
    }
    return self;
}

- (NSMutableDictionary *)userInfo
{
    if(!_userInfo){
        _userInfo = [NSMutableDictionary new];
    }
    return _userInfo;
}
- (void)cleanUserInfo
{
    [self.userInfo removeAllObjects];
}
@end
