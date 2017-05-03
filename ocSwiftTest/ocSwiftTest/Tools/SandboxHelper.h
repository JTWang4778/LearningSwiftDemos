//
//  SandboxHelper.h
//  asdf
//
//  Created by 王锦涛 on 17/2/17.
//  Copyright © 2017年 JTWang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SandboxHelper : NSObject
+ (NSString *)getUserToken;
+ (NSString *)getUserID;
+ (BOOL)isLogining;
@end
