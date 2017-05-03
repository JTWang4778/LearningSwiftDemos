
//  HttpConstant.h
//  xwkt
//
//  Created by 菲律宾街头流浪汉 on 16/7/5.
//  Copyright © 2016年 菲律宾街头流浪汉. All rights reserved.
//
#import "HttpRequest_AFNet.h"
#import "SandboxHelper.h"
#import "NetworkPort.h"

#ifndef HttpConstant_h
#define HttpConstant_h

#pragma mark -
#pragma mark APP接口


////#define DEV
//#define TEST
////#define ONLINE
//
//
//#if  defined(DEV)
////#define OID @"469"
////#define OID @"842"
//#define DownloadSubIndex 25
//#define API_HOST @"http://dev.gn100.com/"
//#define SOCKET_URL @"ws://dev.gn100.com:8001/msg/ws"
//#define SOKET_IMAGE @"http://devf.gn100.com/"
//
//#elif defined(TEST)
////#define OID @"227"
////#define OID @"116"
//#define DownloadSubIndex 21
//#define API_HOST @"http://test.gn100.com/"
//#define SOCKET_URL @"ws://test.gn100.com:8001/msg/ws"
//#define SOKET_IMAGE @"http://testf.gn100.com/"
//
//
//#elif defined(ONLINE)
////#define OID @"842"
////#define OID @"1"
//#define DownloadSubIndex 22
//#define API_HOST @"https://www.yunke.com/"
//#define SOCKET_URL @"ws://message.yunke.com/message.plan.ws"
//#define SOKET_IMAGE @"https://f.gn100.com/"
//#endif

// 接口访问环境key
#define API_HOST_ENVIRONMENT_KEY @"api_host_environment_key"
// 用户token 沙盒key
#define USER_TOKEN_SANDBOX_KEY @"user_token_sandbox_key"
// 用户id 沙盒key
#define USER_ID_SANDBOX_KEY @"user_id_sandbox_key"
// 用户是否登录 沙盒key
#define USER_IS_LOGIN_SANDBOX_KEY @"user_is_login_sandbox_key"
#define API_REALURL(url,paramater)  [NSString stringWithFormat:@"%@%@",url, paramater]


#define kFONT_SIZE_FROM_PX_VALUE(pxValue) ((pxValue+3.0f)*0.5f)
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define NavigationBarColor   [UIColor colorWithHexString:@"#12b7f5"]          //导航栏色值
#define IOS7_OR_LATER  ([[[UIDevice currentDevice]systemVersion]floatValue]>=7.0)
#define IOS8_OR_LATER  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#pragma mark 判断是否小于iOS10
#define IS_Before_IOS10  ([[[UIDevice currentDevice] systemVersion] floatValue] <10.0)
#define Screen_Width  [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height


#define Alert(msg) [[[UIAlertView alloc] initWithTitle:nil message:(msg) delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil] show]
#define SETFONT(num)  [UIFont systemFontOfSize:num];



//arc 支持performSelector:
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

#define kNotificationNetError           @"kNotificationNetError"
#define kNotificationNet3G4G            @"kNotificationNet3G4G"
#define kNotificationNetWIFI            @"kNotificationNetWIFI"


#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


#endif /* HttpConstant_h */
