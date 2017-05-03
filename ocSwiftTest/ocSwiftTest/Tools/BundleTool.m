//
//  BundleTool.m
//  static
//
//  Created by 王锦涛 on 17/2/23.
//  Copyright © 2017年 JTWang. All rights reserved.
//

#import "BundleTool.h"


@implementation BundleTool
+ (NSBundle *)getBundle
{
    return [NSBundle bundleWithPath: [[NSBundle mainBundle] pathForResource: BUNDLE_NAME ofType: @"bundle"]];
}


+ (NSString *)getBundlePath:(NSString *)assetName
{
//    return [NSString stringWithFormat:@"GNGNSDK.bundle/%@",assetName];
    NSBundle *myBundle = [BundleTool getBundle];
    if (myBundle && assetName) {
        
        return [[myBundle resourcePath] stringByAppendingPathComponent: assetName];
    }
    return nil;
}

@end
