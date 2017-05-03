//
//  SandboxHelper.m
//  asdf
//
//  Created by 王锦涛 on 17/2/17.
//  Copyright © 2017年 JTWang. All rights reserved.
//

#import "SandboxHelper.h"
#import "HttpConstant.h"
#import "SVProgressHUD.h"

@implementation SandboxHelper

+ (NSString *)getUserToken
{
//    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:USER_TOKEN_SANDBOX_KEY];
//    if (token) {
//        return token;
//    }else{
//        [SVProgressHUD showImage:nil status:@"没有拿到用户token"];
//        return nil;
//    }
    return @"b0401f83c9887eb659ff07af787ce144";
//    return nil;
}

+ (NSString *)getUserID
{
//    NSString *userID = [[NSUserDefaults standardUserDefaults] objectForKey:USER_ID_SANDBOX_KEY];
//    if (userID) {
//        return userID;
//    }else{
//        [SVProgressHUD showImage:nil status:@"没有拿到用户ID"];
//        return nil;
//    }

    return @"23315";
}
+ (BOOL)isLogining
{
//    return  [[NSUserDefaults standardUserDefaults] boolForKey:USER_IS_LOGIN_SANDBOX_KEY];
    return YES;
}
@end
