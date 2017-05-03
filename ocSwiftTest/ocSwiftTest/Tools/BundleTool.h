//
//  BundleTool.h
//  static
//
//  Created by 王锦涛 on 17/2/23.
//  Copyright © 2017年 JTWang. All rights reserved.
//

#import <Foundation/Foundation.h>
#define BUNDLE_NAME @"GNGNSDK"

@interface BundleTool : NSObject

+ (NSString *)getBundlePath:(NSString *)assetName;
+ (NSBundle *)getBundle;
@end
