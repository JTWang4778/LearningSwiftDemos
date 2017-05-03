//
//  NetworkPort.m
//  GN100
//
//  Created by 侯钦哲 on 15/8/11.
//  Copyright (c) 2015年 侯钦哲. All rights reserved.
//
#include <sys/stat.h>
#import "NetworkPort.h"
#import <CommonCrypto/CommonDigest.h>
#import "SandboxHelper.h"
//#import "SBJson.h"
//#import "UserInfomation.h"
//#import "GlobalManager.h"

//static NSString *oid = @"842";// 小沃机构号 线上使用
static NSString *oid = @"0";

#define API_URL [NSString stringWithFormat:@"%@%@/",[NetworkPort gn_getHost], @"interface"]

#define IOS_CELLULAR    @"pdp_ip0"
#define IOS_WIFI        @"en0"
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"
#define Screen_Width  [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height



@implementation NetworkPort
/*
  返回host地址
 */
+ (NSString *)gn_getHost
{
    
    NSString *host = [[NSUserDefaults standardUserDefaults] objectForKey:API_HOST_ENVIRONMENT_KEY];
    if ([host isEqualToString:@"dev"]) {
        return @"http://dev.gn100.com/";
    }else if ([host isEqualToString:@"test"]){
        return @"http://test.gn100.com/";
    }
    // 默认返回线上
    return @"https://www.yunke.com/";
}

+ (NSString *)gn_getSocket_URL
{
    NSString *socket_url = [[NSUserDefaults standardUserDefaults] objectForKey:API_HOST_ENVIRONMENT_KEY];
    if ([socket_url isEqualToString:@"dev"]) {
        return @"ws://dev.gn100.com:8001/msg/ws";
    }else if ([socket_url isEqualToString:@"test"]){
        return @"ws://test.gn100.com:8001/msg/ws";
    }
    // 默认返回线上
    return @"ws://message.yunke.com/message.plan.ws";
}

+ (NSString *)gn_getSocket_Image
{
    NSString *socket_image = [[NSUserDefaults standardUserDefaults] objectForKey:API_HOST_ENVIRONMENT_KEY];
    if ([socket_image isEqualToString:@"dev"]) {
        return @"http://devf.gn100.com/";
    }else if ([socket_image isEqualToString:@"test"]){
        return @"http://testf.gn100.com/";
    }
    // 默认返回线上
    return @"https://f.gn100.com/";
}


/*
 "os":"a",                           //a(android) 或 i(ios)
 "osv":"4.4.4",                      //系统版本
 "osvc":17,                          //系统版本码
 "udid":"58caf551c5e1de158c4d56",    //唯一设备标志(ios特有)
 "mac":"F0:25:B7:4A:E0:23",          //mac地址
 "ip":"192.168.1.145",               //IP地址
 "imsi":"460021311535949",           //国际移动客户识别码（Android特有）
 "imei":"860308020230328",           //国际移动台设备识别码（Android特有）
 "phone":"18801056956",              //电话（Android特有，可能为空）
 "p":" OPPO_13017 ",                 //产品名称
 "m":"MI 4LTE",                      //机型信息
 "d":"t03gchn",                      //设备信息
 "n":1,                              //网络类型 1-wifi / 2-4g / 3-3g / 4-2g / 5-其他
 "o":1,                              //运营商   1-移动2-联通3-电信
 "rw":1024,                          //屏幕宽度
 "rh":1280,                          //屏幕高度
 "jb":1,                             //是否越狱 1-越狱 0-未越狱(ios特有)
 "cv":"1.4",                         //客户端版本
 "cvc":14                            //客户端版本码
 */

+ (NSDictionary *)getParamsDictionary:(NSDictionary *)params
{
    NSString *version =[[NetworkPort alloc] version];
    //   获取当前的时间
    int liTime = [[NetworkPort alloc] getDateByInt];
    NSString *keymd5 = [[NetworkPort alloc] md5ForParamas:params time:liTime];
    NSDictionary *myparamses =@{
                                @"u":@"i",
                                @"v":version,
                                @"time":@(liTime),
                                @"params":params,
                                @"key":keymd5,
                                @"token":[SandboxHelper getUserToken],
                                @"dinfo":[self getDinfo]
                                };
    NSMutableDictionary *mutalbeDic = [[NSMutableDictionary alloc] initWithDictionary:myparamses];
    if ([[mutalbeDic objectForKey:@"token"]isEqualToString:@"(null)"]) {
        [mutalbeDic removeObjectForKey:@"token"];
    }
    return mutalbeDic;
}


+ (NSDictionary *)getParams:(NSDictionary *)params
{
    NSString *version =[[NetworkPort alloc] version];
    int liTime = [[NetworkPort alloc] getDateByInt];
    NSString *keymd5 = [[NetworkPort alloc] md5ForParamas:params time:liTime];
    NSDictionary *myparamses =@{
                                @"oid":oid,
                                @"u":@"i",
                                @"v":version,
                                @"time":@(liTime),
                                @"params":params,
                                @"key":keymd5,
                                @"token":[SandboxHelper getUserToken],
                                @"dinfo":[self getDinfo],
                                @"oid":oid
                                };
    NSMutableDictionary *mutalbeDic = [[NSMutableDictionary alloc] initWithDictionary:myparamses];
    if ([[mutalbeDic objectForKey:@"token"]isEqualToString:@"(null)"]) {
        [mutalbeDic removeObjectForKey:@"token"];
    }
    return mutalbeDic;
}

+ (NSString *)getAPI:(APIEnum)apiEnum
{
    NSString * apiString = @""; // set default url
    switch (apiEnum)
    {
        case API_LOGIN:
            apiString = API_REALURL(API_URL, @"login");
            break;
        case API_LOGIN_SMS:
            apiString = API_REALURL(API_URL, @"login/smsLogin");
            break;
        case API_LOGIN_CODE:
            apiString = API_REALURL(API_URL, @"user/GetVerificationCode");
            break;
        case API_LOGIN_CHECKCODE:
            apiString = API_REALURL(API_URL, @"user/CheckVerify");
            break;
        case API_LOGIN_REGISTER:
            apiString = API_REALURL(API_URL, @"user/RegisterV2");
            break;
        case API_LOGIN_QQ:
            apiString = API_REALURL(API_URL, @"user/Partner");
            break;
        case API_LOGIN_BIND:
            apiString = API_REALURL(API_URL, @"user/CheckIsBind");
            break;
        case API_LOGIN_USERNAME:
            apiString = API_REALURL(API_URL, @"user/UpdateUserRealName");
            break;
        case API_SIGNIN:
            
            break;
        case API_PERSON_DATA:
            apiString = API_REALURL(API_URL, @"user/UserLevel");
            break;
        case API_CATEGORY:
//            apiString = API_REALURL(API_URL, @"search/getAllCate"); // 兴趣分类为一个接口
            apiString = API_REALURL(API_URL, @"/search/gettag");
            break;
        case API_HOME:
            apiString = API_REALURL(API_URL,@"main/homev2");
            break;
        case API_PERSON_CENTER:
            apiString = API_REALURL(API_URL,@"org/studentCourse");
            break;
        case API_COURSE_CATALOG:
            apiString = API_REALURL(API_URL,@"course/catalog");
            break;
        case API_COURSE_COMMENT:
            apiString = API_REALURL(API_URL,@"course/commentv2");
            break;
        case API_COURSE_FILTER:
            apiString = API_REALURL(API_URL,@"search/coursefilter");
            break;
        case API_COURSE_SUMMARY:
            apiString = API_REALURL(API_URL,@"course/summary");
        case API_Interest:
            apiString = API_REALURL(API_URL, @"search/gettag");
            break;
        case API_COURSE_DETAIL:
            apiString = API_REALURL(API_URL,@"course/detail");
            break;
        case API_COURSE_ADDFAVOR:
            apiString = API_REALURL(API_URL,@"org/addFav");
            break;
        case API_COURSE_DELFAVOR:
            apiString = API_REALURL(API_URL, @"org/delFav");
            break;
        case API_COURSE_FAVORLIST:
            apiString = API_REALURL(API_URL, @"org/myfav");
            break;
        case API_COURSE_DELCOMMENT:
            apiString = API_REALURL(API_URL, @"user/delcomment");
            break;
        case API_EVALUATTE:
            apiString = API_REALURL(API_URL, @"user/AddComment");
            break;
        case API_COURSE_ADDREG:
            apiString = API_REALURL(API_URL, @"user/addReg");
            break;
        case API_TEACHER_INFO:
            apiString = API_REALURL(API_URL, @"teacher/detail");
            break;
        case API_TEACHER_COMMENT:
            apiString = API_REALURL(API_URL, @"teacher/commentv2");
            break;
        case API_TEACHER_ADDFAV:
            apiString = API_REALURL(API_URL, @"teacher/setFav");
            break;
        case API_TEACHER_TASKLIST:
            apiString = API_REALURL(API_URL, @"teacherTask/TaskList");
            break;
        case API_TEACHER_COURSECLASS:
            apiString = API_REALURL(API_URL, @"teacherTask/CourseClass");
            break;
        case API_SEARCH:
            apiString = API_REALURL(API_URL, @"search/courseSearch");
            break;
        case API_MESSAGE_GETLIST:
            apiString = API_REALURL(API_URL, @"message/getdialoglistV2");
            break;
        case API_MESSAGE_GETNUM:
            apiString = API_REALURL(API_URL, @"org/msgNum");
            break;
        case API_MESSAGE_ADDMESSAGE:
            apiString = API_REALURL(API_URL, @"message/addDialog");
            break;
        case API_MESSAGE_CHATSINGLE:
            apiString = API_REALURL(API_URL, @"message/ChatSingle");
            break;
        case API_PERSON_SETINFO:
            apiString = API_REALURL(API_URL, @"user/SetUserInfo");
            break;
        case API_PERSON_UPDATEURL:
            apiString = API_REALURL(API_URL, @"user/uploadpic");
            break;
        case API_PERSON_GETINFO:
            apiString = API_REALURL(API_URL, @"user/GetInfo");
            break;
        case API_PLAN_INFO:
            apiString = API_REALURL([self gn_getHost], @"player/plan/info");
            break;
        case API_LIVE_PLAN_INFO:
            apiString = API_REALURL(API_URL, @"play/planinfo");
            break;
        case API_PLAN_GETMYCOMMENT:
            apiString = API_REALURL(API_URL, @"plan/GetComment");
            break;
        case API_PLAN_COMMENTSTATUS:
            apiString = API_REALURL(API_URL, @"plan/PlanCommentStatus");
            break;
        case API_PLAY_ADDNOTE:
            apiString = API_REALURL(API_URL, @"note/NoteAdd");
            break;
        case API_PLAY_DELNOTE:
            apiString = API_REALURL(API_URL, @"note/DelNote");
            break;
        case API_PLAY_UPDATENOTE:
            apiString = API_REALURL(API_URL, @"note/UpdateNote");
            break;
        case API_PLAY_GETNOTES:
            apiString = API_REALURL(API_URL, @"note/NoteList");
            break;
        case API_PLAY_GETNOTICES:
            apiString = API_REALURL(API_URL, @"video/GetTeacherPoint");
            break;
        case API_PLAY_GETPUBLICNOTICE:
            apiString = API_REALURL(API_URL, @"announcement/GetAnnouncement");
            break;
        case API_TEACHER_GET_NOTICE:
            apiString = API_REALURL(API_URL, @"announcement/GetAnnouncement");
            break;
        case API_TEACHER_ADD_EDIT_DELETE_NOTICE:
            apiString = API_REALURL(API_URL, @"announcement/Announcement");
            break;
        case API_TEACHER_START_PUSH:
            apiString = API_REALURL(API_URL, @"plan/StartPlay");
            break;
        case API_TEACHER_CLOSE_PUSH:
            apiString = API_REALURL(API_URL, @"plan/closePlay");
            break;
        case API_CUSTOMNAVI:
            apiString = API_REALURL(API_URL, @"org/CustomNav");
            break;
        case API_LIVETABLE:
            apiString = API_REALURL(API_URL, @"plan/latelyLiveTop");
            break;
        case API_COURSE_PREFILE:
            apiString = API_REALURL(API_URL, @"course/AttachList");
            break;
        case API_LATELIVELIST:
            apiString = API_REALURL(API_URL, @"plan/latelyLiveList");
            break;
        case API_HOME_TEACHER:
            apiString = API_REALURL(API_URL, @"teacher/famousList");
            break;
        case API_USER_SIGN:
            apiString = API_REALURL(API_URL, @"user/Sign");
            break;
        case API_TEACHERSEARCHER:
            apiString = API_REALURL(API_URL, @"search/teacher");
            break;
        case API_CHECKTOKEN:
            apiString = API_REALURL(API_URL, @"login/checkToken");
            break;
        case API_TEAHCER_WORK_DETAIL:
            apiString = API_REALURL(API_URL, @"teacherTask/TaskDetail");
            break;
        case API_TEACHER_PUBLISHTASK:
            apiString = API_REALURL(API_URL, @"teacherTask/PublishTask");
            break;
        case API_TEACHER_UPLOADIMAGE:
            apiString = API_REALURL(API_URL, @"teacherTask/UploadImage");
            break;
        case API_TEACHER_WORK_REPLYDETAIL:
            apiString = API_REALURL(API_URL, @"teacherTask/TaskReplyDetail");
            break;
        case API_TEACHER_PUSHMESSAGE:
            apiString = API_REALURL(API_URL, @"teacherTask/PushMessage");
            break;
        default:
            break;
    }
    
    return apiString;
}
// 登录接口参数
+ (NSDictionary *)getLoginParams:(NSString *)userName andPassword:(NSString *)password {
    
    NSDictionary *paramas = @{@"name":userName,@"password":password,@"streaminfo":@"yes"};
    //   获取当前的时间
    int liTime = [[NetworkPort alloc] getDateByInt];
    
    NSString *version = [[NetworkPort alloc] version];
    NSString *keymd5 = [[NetworkPort alloc] md5ForParamas:paramas time:liTime];
    NSDictionary *myParamas = @{@"u":@"i",@"v":version,@"time":@(liTime),@"params":paramas,@"key":keymd5,@"dinfo":[self getDinfo]};
    // 清除 cookie
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray *_tmpArray = [NSArray arrayWithArray:[cookieJar cookies]];
    for (id obj in _tmpArray) {
        [cookieJar deleteCookie:obj];
    }
    return myParamas;
}

/*** 根据planId获取上课通知信息*/
+(NSDictionary *)getClassNotificationRelust:(NSString *)plan_id uid:(NSString *)uid content:(NSString *)content type:(NSInteger)type user_from_id:(NSString *)user_from_id userToken:(NSString *)userToken
{
    
    //必传参数
    NSDictionary *paramas =@{
                             @"plan_id":plan_id,
                             @"uid":uid,
                             @"content":content,
                             @"type":@(type),
                             @"user_from_id":user_from_id,
                             @"userToken":userToken
                             };
    NSString *version =[[NetworkPort alloc] version];
    //   获取当前的时间
    int liTime = [[NetworkPort alloc] getDateByInt];
    NSString *keymd5 = [[NetworkPort alloc] md5ForParamas:paramas time:liTime];
    NSDictionary *myparamses =@{
                                @"u":@"i",
                                @"v":version,
                                @"time":@(liTime),
                                @"params":paramas,
                                @"key":keymd5,
                                @"token":[SandboxHelper getUserToken],
                                @"dinfo":[self getDinfo]
                                };
    return myparamses;
}
/***  上课页统一发送通知Url*/
+(NSString *)goClassPostNotificationByPlanId
{
             // https://message.yunke.com/message.plan.ws/
    return @"https://message.yunke.com/message.plan.ws/";
//    return API_REALURL(API_URL, @"message/add");
}



/**
 *  *****************************************参与运算*********************************
 */
// 参数md5 key值
- (NSString *)md5ForParamas:(NSDictionary *)paramas time:(int) aiTime
{
    
    SBJsonWriter *jsonWriter = [[SBJsonWriter alloc] init];
    NSString *jsonParserString = [jsonWriter stringWithObject:paramas];
    
    //NSLog(@"jsonParserString %@", jsonParserString);
    NSString *myString = [NSString stringWithFormat:@"%@%d%@",jsonParserString,aiTime, salt];
    
    NSString *keyMD5 = [[NetworkPort alloc] getMd5_32Bit_String:myString];
    NSString *keymd5 = [[NetworkPort alloc] getMd5_32Bit_String:keyMD5];
    
    //NSLog(@"keymd5 : %@", keymd5);
    
    return keymd5;
}
//  当前系统时间
- (int) getDateByInt
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *date = [dateFormat dateFromString:[dateFormat stringFromDate:[NSDate date]]];
    NSTimeInterval dateInterval = [date timeIntervalSince1970];
    int liDate = (int) dateInterval;
    return liDate;
}
// Version
- (NSString *)version {
    
    NSString *string = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
    NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:string];
    NSString *version = [dic objectForKey:@"CFBundleVersion"];
    return version;
    
}
//  MD5
- (NSString *)getMd5_32Bit_String:(NSString *)srcString
{
    const char *cStr = [srcString UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (unsigned int)strlen(cStr), digest );
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    
    return result;
}
#pragma mark 新版加入参数
/*“dinfo”:
 {
 "os":"a",                           //a(android) 或 i(ios) *
 "osv":"4.4.4",                      //系统版本  *
 "osvc":17,                          //系统版本码 ------ 未知
 "udid":"58caf551c5e1de158c4d56",    //唯一设备标志(ios特有) *
 "mac":"F0:25:B7:4A:E0:23",          //mac地址 *
 "ip":"192.168.1.145",               //IP地址 *
 "phone":"18801056956",              //电话（Android特有，可能为空） -- kong
 "imsi":"460021311535949",           //国际移动客户识别码（Android特有） --
 "imei":"860308020230328",           //国际移动台设备识别码（Android特有） --
 "p":" OPPO_13017 ",                 //产品名称 *
 "m":"MI 4LTE",                      //机型信息  *
 "d":"t03gchn",                      //设备信息 ---- 未知
 "n":1,                              //网络类型 1-wifi / 2-4g / 3-3g / 4-2g / 5-其他 * --- 未知
 "o":1,                              //运营商   1-移动2-联通3-电信 *
 "rw":1024,                          //屏幕宽度 *
 "rh":1280,                          //屏幕高度 *
 "jb":1,                             //是否越狱 1-越狱 0-未越狱(ios特有)  *
 "cv":"1.4",                         //客户端版本 *
 "cvc":14                            //客户端版本码 ---- 未知
 }*/
+ (NSDictionary *)getDinfo {
    NSString *mac = [self macaddress];
    NSString *udid = [self uuid];
    NSString *ip = [self ipAddressIsV4:YES];
    NSString *p =  [self getDeviceInfo];
    NSString *jb = [NSString stringWithFormat:@"%i",[NetworkPort jailbroken]];
    NSString *rw = [NSString stringWithFormat:@"%.f",Screen_Width];
    NSString *rh = [NSString stringWithFormat:@"%.f",Screen_Height];
    NSString * o = [self chinaMobileModel];
    NSString *m = [self deviceName];
    NSString *osv = [self getSystemVersion];
    NSString *cv = [NSString stringWithFormat:@"%ld",[self version]];
    NSString *n = [self getNetWorkStates];
    NSDictionary *dinfo = @{
                            @"os":@"i",
                            @"osv": osv,
                            @"osvc":@"17",
                            @"udid": udid,
                            @"ip":ip,
                            @"p":p,
                            @"jb":jb,
                            @"rw":rw,
                            @"rh":rh,
                            @"o":o,
                            @"m":m,
                            @"cv":cv,
                            @"cvc":@"14",
                            @"mac": mac,
                            @"n":n,
                            @"d":@"毛线",
                            @"phone":@"",
                            @"imsi":@"",
                            @"imei":@""
                            };
    return dinfo;
}
+ (NSString *)deviceModel
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *model = malloc(size);
    sysctlbyname("hw.machine", model, &size, NULL, 0);
    NSString *deviceModel = [NSString stringWithCString:model encoding:NSUTF8StringEncoding];
    free(model);
    return deviceModel;
}
// 机型信息
+ (NSString *)deviceName
{
    NSString *platform = [self deviceModel];
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4 (GSM)";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (CDMA)";
    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad Mini (GSM)";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad Mini (CDMA)";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3 (GSM)";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
    
    if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air (GSM)";
    if ([platform isEqualToString:@"iPad4,3"])      return @"iPad Air (CDMA)";
    if ([platform isEqualToString:@"iPad4,4"])      return @"iPad Mini Retina (WiFi)";
    if ([platform isEqualToString:@"iPad4,5"])      return @"iPad Mini Retina (CDMA)";
    
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    return platform;
}

// 获取设备uuid
+ (NSString*) uuid {
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    CFRelease(puuid);
    CFRelease(uuidString);
    return result;
}
// 设备mac 地址
+ (NSString *) macaddress
{
    
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1/n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    
    free(buf);
    
    return [outstring uppercaseString];
}
// ip 地址
+ (NSString *)ipAddressIsV4:(BOOL)v4
{
    NSArray *searchArray = v4 ?
    @[ IOS_WIFI @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6 ] :
    @[ IOS_WIFI @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4 ] ;
    
    NSDictionary *addresses = [self addressInfo];
    
    __block NSString *address;
    [searchArray enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop)
     {
         address = addresses[key];
         if(address) *stop = YES;
         
     } ];
    return address ? address : @"0.0.0.0";
}

+ (NSDictionary *)addressInfo
{
    NSMutableDictionary *addresses = [NSMutableDictionary dictionaryWithCapacity:8];
    
    // retrieve the current interfaces - returns 0 on success
    struct ifaddrs *interfaces;
    if(!getifaddrs(&interfaces)) {
        // Loop through linked list of interfaces
        struct ifaddrs *interface;
        for(interface=interfaces; interface; interface=interface->ifa_next) {
            if(!(interface->ifa_flags & IFF_UP) || (interface->ifa_flags & IFF_LOOPBACK)) {
                continue; // deeply nested code harder to read
            }
            const struct sockaddr_in *addr = (const struct sockaddr_in*)interface->ifa_addr;
            if(addr && (addr->sin_family==AF_INET || addr->sin_family==AF_INET6)) {
                NSString *name = [NSString stringWithUTF8String:interface->ifa_name];
                char addrBuf[INET6_ADDRSTRLEN];
                if(inet_ntop(addr->sin_family, &addr->sin_addr, addrBuf, sizeof(addrBuf))) {
                    NSString *key = [NSString stringWithFormat:@"%@/%@", name, addr->sin_family == AF_INET ? IP_ADDR_IPv4 : IP_ADDR_IPv6];
                    addresses[key] = [NSString stringWithUTF8String:addrBuf];
                }
            }
        }
        // Free memory
        freeifaddrs(interfaces);
    }
    return [addresses count] ? addresses : nil;
    
}
// 设备信息 产品名称
+ (NSString *)getDeviceInfo {
    UIDevice *device = [[UIDevice alloc] init];
    NSString *name = device.name;       //获取设备所有者的名称
    NSString *model = device.model;      //获取设备的类别
    NSString *type = device.localizedModel; //获取本地化版本
    NSString *systemName = device.systemName;   //获取当前运行的系统
    NSString *systemVersion = device.systemVersion;//获取当前系统的版本
    NSLog(@"-----name : %@,model : %@,type : %@,systemName :%@,systemVersion %@",name,model,type,systemName,systemVersion);
    return model;
}
+ (NSString *)getSystemVersion {
    UIDevice *device = [[UIDevice alloc] init];
    NSString *systemVersion = device.systemVersion;
    return systemVersion;
}
// 获取网络类型

// 是否越狱
+ (BOOL)jailbroken
{
#if !TARGET_IPHONE_SIMULATOR
    
    //Apps and System check list
    BOOL isDirectory;
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    if ([defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@%@%@", @"App", @"lic",@"ati", @"ons/", @"Cyd", @"ia.a", @"pp"]]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@%@%@", @"App", @"lic",@"ati", @"ons/", @"bla", @"ckra1n.a", @"pp"]]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@%@%@", @"App", @"lic",@"ati", @"ons/", @"Fake", @"Carrier.a", @"pp"]]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@%@%@", @"App", @"lic",@"ati", @"ons/", @"Ic", @"y.a", @"pp"]]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@%@%@", @"App", @"lic",@"ati", @"ons/", @"Inte", @"lliScreen.a", @"pp"]]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@%@%@", @"App", @"lic",@"ati", @"ons/", @"MxT", @"ube.a", @"pp"]]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@%@%@", @"App", @"lic",@"ati", @"ons/", @"Roc", @"kApp.a", @"pp"]]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@%@%@", @"App", @"lic",@"ati", @"ons/", @"SBSet", @"ttings.a", @"pp"]]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@%@%@", @"App", @"lic",@"ati", @"ons/", @"Wint", @"erBoard.a", @"pp"]]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@%@", @"pr", @"iva",@"te/v", @"ar/l", @"ib/a", @"pt/"] isDirectory:&isDirectory]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@%@", @"pr", @"iva",@"te/v", @"ar/l", @"ib/c", @"ydia/"] isDirectory:&isDirectory]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@%@", @"pr", @"iva",@"te/v", @"ar/mobile", @"Library/SBSettings", @"Themes/"] isDirectory:&isDirectory]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@%@", @"pr", @"iva",@"te/v", @"ar/t", @"mp/cyd", @"ia.log"]]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@", @"pr", @"iva",@"te/v", @"ar/s", @"tash/"] isDirectory:&isDirectory]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@%@", @"us", @"r/l",@"ibe", @"xe", @"c/cy", @"dia/"] isDirectory:&isDirectory]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@", @"us", @"r/b",@"in", @"s", @"shd"]]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@", @"us", @"r/sb",@"in", @"s", @"shd"]]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@%@", @"us", @"r/l",@"ibe", @"xe", @"c/cy", @"dia/"] isDirectory:&isDirectory]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@%@", @"us", @"r/l",@"ibe", @"xe", @"c/sftp-", @"server"]]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@%@",@"/Syste",@"tem/Lib",@"rary/Lau",@"nchDae",@"mons/com.ike",@"y.bbot.plist"]]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@%@%@%@",@"/Sy",@"stem/Lib",@"rary/Laun",@"chDae",@"mons/com.saur",@"ik.Cy",@"@dia.Star",@"tup.plist"]]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@", @"/Libr",@"ary/Mo",@"bileSubstra",@"te/MobileSubs",@"trate.dylib"]]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@", @"/va",@"r/c",@"ach",@"e/a",@"pt/"] isDirectory:&isDirectory]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@", @"/va",@"r/l",@"ib",@"/apt/"] isDirectory:&isDirectory]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@", @"/va",@"r/l",@"ib/c",@"ydia/"] isDirectory:&isDirectory]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@", @"/va",@"r/l",@"og/s",@"yslog"]]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@", @"/bi",@"n/b",@"ash"]]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@", @"/b",@"in/",@"sh"]]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@", @"/et",@"c/a",@"pt/"]isDirectory:&isDirectory]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@", @"/etc/s",@"sh/s",@"shd_config"]]
        || [defaultManager fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@", @"/us",@"r/li",@"bexe",@"c/ssh-k",@"eysign"]])
        
    {
        return YES;
    }
    
    // SandBox Integrity Check
    int pid = fork(); //返回值：子进程返回0，父进程中返回子进程ID，出错则返回-1
    if(!pid){
        exit(0);
    }
    if(pid>=0)
    {
        return YES;
    }
    
    //Symbolic link verification
    struct stat s;
    if(lstat("/Applications", &s) || lstat("/var/stash/Library/Ringtones", &s) || lstat("/var/stash/Library/Wallpaper", &s)
       || lstat("/var/stash/usr/include", &s) || lstat("/var/stash/usr/libexec", &s)  || lstat("/var/stash/usr/share", &s)
       || lstat("/var/stash/usr/arm-apple-darwin9", &s))
    {
        if(s.st_mode & S_IFLNK){
            return YES;
        }
    }
    
    //Try to write file in private
    NSError *error;
    [[NSString stringWithFormat:@"Jailbreak test string"] writeToFile:@"/private/test_jb.txt" atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    if(nil==error){
        //Writed
        return YES;
    } else {
        [defaultManager removeItemAtPath:@"/private/test_jb.txt" error:nil];
    }
    
#endif
    return NO;
}
// 运营商
+ (NSString *)chinaMobileModel
{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    if (carrier == nil) {
//        return @"不识别";
        return @"0";
    }
    
    NSString *code = [carrier mobileNetworkCode];
    if (code == nil) {
//        return @"不识别";
        return @"0";
    }
    
    if ([code isEqualToString:@"00"] || [code isEqualToString:@"02"] || [code isEqualToString:@"07"])
    {
//        return @"移动";
        return @"1";
    }else if ([code isEqualToString:@"01"] || [code isEqualToString:@"06"])
    {
//        return @"联通";
        return @"2";
    }else if ([code isEqualToString:@"03"] || [code isEqualToString:@"05"])
    {
//        return @"电信";
        return @"3";
    }else if ([code isEqualToString:@"20"])
    {
        return @"铁通";
    }
    return @"不识别";
}
//  判断当前网络连接状态
+(NSString *)getNetWorkStates{
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *children = [[[app valueForKeyPath:@"statusBar"]valueForKeyPath:@"foregroundView"]subviews];
    NSString *state = [[NSString alloc]init];
    int netType = 0;
    //获取到网络返回码
    for (id child in children) {
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            //获取到状态栏
            netType = [[child valueForKeyPath:@"dataNetworkType"]intValue];
            
            switch (netType) {
                case 0:
//                    state = @"无网络"; // 5
                    state = @"5";
                    //无网模式
                    break;
                case 1:
//                    state = @"2G"; // 1
                    state = @"1";
                    break;
                case 2:
//                    state = @"3G"; // 2
                    state = @"3";
                    break;
                case 3:
//                    state = @"4G"; //3
                    state = @"4";
                    break;
                case 5:
//                    state = @"WIFI"; //5
                    state = @"5";
                    break;
                default:
                    break;
            }
        }
    }
    //根据状态选择
    return state;
}

#pragma -mark -我的订单列表
+(NSDictionary *)getOrderParames:(NSString *)Ouid status:(NSString *)OStatus token:(NSString *)token page:(NSNumber * )page length:(NSNumber * )length;
{
    NSDictionary *paramas =@{
                             @"uid":Ouid,
                             @"status":OStatus,
                             @"page":page,
                             @"length":length,
                             };
    NSString *version =[[NetworkPort alloc] version];
    //   获取当前的时间
    int liTime = [[NetworkPort alloc] getDateByInt];
    NSString *keymd5 = [[NetworkPort alloc] md5ForParamas:paramas time:liTime];
    NSDictionary *myparamses =@{
                                @"oid":oid,
                                @"u":@"i",
                                @"v":version,
                                @"time":@(liTime),
                                @"params":paramas,
                                @"key":keymd5,
                                @"token":token,
                                @"dinfo":[self getDinfo]
                                };
    return myparamses;
}

#pragma mark--我的会员中心
/**
 *  我的会员中心
 */
+(NSDictionary *)getVIPParames:(NSString *)Ouid token:(NSString *)token
{
    NSDictionary *paramas =@{
                             @"userId":Ouid,
                             };
    NSString *version =[[NetworkPort alloc] version];
    //   获取当前的时间
    int liTime = [[NetworkPort alloc] getDateByInt];
    NSString *keymd5 = [[NetworkPort alloc] md5ForParamas:paramas time:liTime];
    NSDictionary *myparamses =@{
                                @"oid":oid,
                                @"u":@"i",
                                @"v":version,
                                @"time":@(liTime),
                                @"params":paramas,
                                @"key":keymd5,
                                @"dinfo":[self getDinfo],
                                @"token":token
                                };
    return myparamses;
}

//会员中心地址
+(NSString *)getVIPCenter{
    return [NSString stringWithFormat:@"%@member",API_URL];
    return @"http://dev.gn100.com/interface/member";
}
//学生作业列表
+(NSString *)getStudentTaskList{
    return [NSString stringWithFormat:@"%@studentTask/StudentTaskList",API_URL];
    return @"http://dev.gn100.com/interface/studentTask/StudentTaskList";
}
//获得题目Id
+(NSString *)getQuestionId{
    return [NSString stringWithFormat:@"%@/plan/getQuestionId",API_URL];
    return @"http://dev.gn100.com/interface/plan/getQuestionId";
}
//答案统计
+(NSString *)getAddAnswerLog{
    return [NSString stringWithFormat:@"%@/plan/addAnswerLog",API_URL];
    return @"http://dev.gn100.com/interface/plan/addAnswerLog";
}
//获得学生列表
+(NSString *)getStudentList{
    return [NSString stringWithFormat:@"%@/course/student",API_URL];
    return @"http://dev.gn100.com/interface/course/student";
}
//
//未提交作业详情页
+(NSString *)getStudentNoCommitList{
    return [NSString stringWithFormat:@"%@studentTask/GetNoCommitList",API_URL];
    return @"http://dev.gn100.com/interface/studentTask/GetNoCommitList";
}
//待批改作业详情页
+(NSString *)getWaitToCheckDetail{
    return [NSString stringWithFormat:@"%@studentTask/StudentTaskDetail",API_URL];
    return @"http://dev.gn100.com/interface/studentTask/StudentTaskDetail";
}
//已批改作业详情页
+(NSString *)getAlreadyCheckDetail{
    return [NSString stringWithFormat:@"%@studentTask/TaskShow",API_URL];
    return @"http://dev.gn100.com/interface/studentTask/TaskShow";
}
//上传图片
+(NSString *)getUploadImage{
    return [NSString stringWithFormat:@"%@studentTask/UploadImage",API_URL];
    return @"dev.gn100.com/interface/studentTask/UploadImage";
}

//上传作业
+(NSString *)getCommitTask{
    return [NSString stringWithFormat:@"%@studentTask/CommitTask",API_URL];
    return @"dev.gn100.com/interface/studentTask/CommitTask";
}


//我的订单列表地址
+(NSString *)getOrderInfo
{
    return [NSString stringWithFormat:@"%@user/order",API_URL];
    return @"http://dev.gn100.com/interface/user/order";
}

#pragma -mark -会员套餐课程列表
+(NSString *)getCourseList
{
    return [NSString stringWithFormat:@"%@member/courseList",API_URL];
    return @"http://dev.gn100.com/interface/member/courseList";
}
#pragma -mark -下订单
+(NSString *)getConfirmOrder
{
    return [NSString stringWithFormat:@"%@user/orderInfo",API_URL];
    return @"http://dev.gn100.com/interface/user/orderInfo";
}
#pragma -mark -会员课程列表
+(NSDictionary *)getOrderOuid:(NSString *)Ouid memberId:(NSString *)memberId token:(NSString *)token page:(NSNumber * )page length:(NSNumber * )length
{
    NSDictionary *paramas =@{
                             @"userId":Ouid,
                             @"memberId":memberId,
                             @"page":page,
                             @"length":length,
                             };
    NSString *version =[[NetworkPort alloc] version];
    //   获取当前的时间
    int liTime = [[NetworkPort alloc] getDateByInt];
    NSString *keymd5 = [[NetworkPort alloc] md5ForParamas:paramas time:liTime];
    NSDictionary *myparamses =@{
                                @"oid":oid,
                                @"u":@"i",
                                @"v":version,
                                @"time":@(liTime),
                                @"params":paramas,
                                @"key":keymd5,
                                @"dinfo":[self getDinfo],
                                @"token":token
                                };
    return myparamses;
}

#pragma -mark -下订单
+(NSDictionary *)getOrderOuid:(NSString *)Ouid objectId:(NSNumber *)objectId token:(NSString *)token ext:(NSNumber * )ext objectType:(NSNumber * )objectType
{
    NSDictionary *paramas =@{
                             @"userId":Ouid,
                             @"objectId":objectId,
                             @"ext":ext,
                             @"objectType":objectType,
                             };
    NSString *version =[[NetworkPort alloc] version];
    //   获取当前的时间
    int liTime = [[NetworkPort alloc] getDateByInt];
    NSString *keymd5 = [[NetworkPort alloc] md5ForParamas:paramas time:liTime];
    NSDictionary *myparamses =@{
                                @"oid":oid,
                                @"u":@"i",
                                @"v":version,
                                @"time":@(liTime),
                                @"params":paramas,
                                @"key":keymd5,
                                @"dinfo":[self getDinfo],
                                @"token":token
                                };
    return myparamses;
}

#pragma mark--删除某个订单详情
/**
 *  删除某个订单详情
 */
+(NSDictionary *)deleteOrderParames:(NSString *)orderId
{
    NSDictionary *paramas =@{
                             @"orderId":orderId
                             };
    NSString *version =[[NetworkPort alloc] version];
    //   获取当前的时间
    int liTime = [[NetworkPort alloc] getDateByInt];
    NSString *keymd5 = [[NetworkPort alloc] md5ForParamas:paramas time:liTime];
    NSDictionary *myparamses =@{
                                @"u":@"i",
                                @"v":version,
                                @"time":@(liTime),
                                @"params":paramas,
                                @"key":keymd5,
                                @"dinfo":[self getDinfo]
                                };
    return myparamses;
}
/***  删除某个订单详情*/
+(NSString *)deleteOrderDetail
{   return [NSString stringWithFormat:@"%@user/delorder",API_URL];
    return @"http://dev.gn100.com/interface/user/delorder";
}

/***  取消某个订单详情*/
+(NSString *)cancelOrderDetail
{   return [NSString stringWithFormat:@"%@user/orderstatus",API_URL];
    return @"http://dev.gn100.com/interface/user/orderstatus";
}

#pragma mark--取消某个订单详情
/**
 *  取消某个订单详情
 */
+(NSDictionary *)cancelOrderParames:(NSString *)OrderId
{
    NSDictionary *paramas =@{
                             @"orderId":OrderId
                             };
    NSString *version =[[NetworkPort alloc] version];
    //   获取当前的时间
    int liTime = [[NetworkPort alloc] getDateByInt];
    NSString *keymd5 = [[NetworkPort alloc] md5ForParamas:paramas time:liTime];
    NSDictionary *myparamses =@{
                                @"u":@"i",
                                @"v":version,
                                @"time":@(liTime),
                                @"params":paramas,
                                @"key":keymd5,
                                @"dinfo":[self getDinfo]
                                };
    return myparamses;
}
#pragma mark--生成订单
+(NSDictionary *)getAddOrderlWithObjectType:(NSNumber *)objectType   objectId:(NSNumber *)objectId ext:(NSNumber *)ext uid:(NSString *)uid token:(NSString *)token
{
    NSDictionary *paramas =@{
                             @"objectType":objectType,
                             @"objectId":objectId,
                             @"userId":uid,
                             @"ext":ext
                             };
    NSString *version =[[NetworkPort alloc] version];
    //   获取当前的时间
    int liTime = [[NetworkPort alloc] getDateByInt];
    NSString *keymd5 = [[NetworkPort alloc] md5ForParamas:paramas time:liTime];
    NSDictionary *myparamses =@{
                                @"oid":oid,
                                @"u":@"i",
                                @"v":version,
                                @"time":@(liTime),
                                @"params":paramas,
                                @"key":keymd5,
                                @"dinfo":[self getDinfo],
                                @"token":token
                                };
    return myparamses;
}

//生成订单地址
+(NSString *)getAddOrder
{
    return [NSString stringWithFormat:@"%@user/addOrderV2",API_URL];
    return @"http://dev.gn100.com/interface/user/addOrderV2";
}

#pragma mark--获得订单详情
+(NSDictionary *)getOrderDetailWithUserId:(NSString *)uid OrderId:(NSString *)orderId objectType:(NSNumber *)objectType token:(NSString *)token
{
    NSDictionary *paramas =@{
                             @"userId":uid,
                             @"orderId":orderId,
                             @"objectType":objectType
                             };
    NSString *version =[[NetworkPort alloc] version];
    //   获取当前的时间
    int liTime = [[NetworkPort alloc] getDateByInt];
    NSString *keymd5 = [[NetworkPort alloc] md5ForParamas:paramas time:liTime];
    NSDictionary *myparamses =@{
                                @"oid":oid,
                                @"u":@"i",
                                @"v":version,
                                @"time":@(liTime),
                                @"params":paramas,
                                @"key":keymd5,
                                @"dinfo":[self getDinfo],
                                @"token":token
                                };
    return myparamses;
}

//获得订单详情地址
+(NSString *)getOrderDetail
{
    return [NSString stringWithFormat:@"%@user/orderDetail",API_URL];
    return @"http://dev.gn100.com/interface/user/orderDetail";
}

#pragma mark--云点支付请求
+(NSDictionary *)getYunPayWithUserId:(NSString *)uid OrderId:(NSString *)orderId objectType:(NSNumber *)objectType
{
   // NSInteger objtype = objectType.integerValue;
    NSDictionary *paramas =@{
                             @"userId":uid,
                             @"orderId":orderId,
                             @"objectType":objectType
                             };
    NSString *version =[[NetworkPort alloc] version];
    //   获取当前的时间
    int liTime = [[NetworkPort alloc] getDateByInt];
    NSString *keymd5 = [[NetworkPort alloc] md5ForParamas:paramas time:liTime];
    NSDictionary *myparamses =@{
                                @"u":@"i",
                                @"v":version,
                                @"time":@(liTime),
                                @"params":paramas,
                                @"key":keymd5,
                                @"dinfo":[self getDinfo],
                                };
    return myparamses;
}

//云点支付地址
+(NSString *)getYunPay{
    return [NSString stringWithFormat:@"%@value/YunPay",API_URL];
    return @"http://dev.gn100.com/interface/value/YunPay";
}

#pragma mark--获得商品详情
+(NSDictionary *)getProductsWithUserId:(NSString *)uid
{
    NSDictionary *paramas =@{
                             @"userId":uid
                             };
    NSString *version =[[NetworkPort alloc] version];
    //   获取当前的时间
    int liTime = [[NetworkPort alloc] getDateByInt];
    NSString *keymd5 = [[NetworkPort alloc] md5ForParamas:paramas time:liTime];
    NSDictionary *myparamses =@{
                                @"oid":oid,
                                @"u":@"i",
                                @"v":version,
                                @"time":@(liTime),
                                @"params":paramas,
                                @"key":keymd5,
                                @"dinfo":[self getDinfo]
                                };
    return myparamses;
}

//获得商品地址
+(NSString *)getProducts
{
    return [NSString stringWithFormat:@"%@value/GetUserBalance",API_URL];
    return @"http://dev.gn100.com/interface/value/GetUserBalance";
}

#pragma mark-IAP充值验证
+(NSDictionary *)getVerifyPaymentWithUserId:(NSString *)uid transactionId:(NSString *)transactionId andPayCert:(NSString *)payCert
{
    NSDictionary *paramas =@{
                             @"userId":uid,
                             @"transactionId":transactionId,
                             @"payCert":payCert
                             };
    NSString *version =[[NetworkPort alloc] version];
    //   获取当前的时间
    int liTime = [[NetworkPort alloc] getDateByInt];
    NSString *keymd5 = [[NetworkPort alloc] md5ForParamas:paramas time:liTime];
    NSDictionary *myparamses =@{
                                @"oid":oid,
                                @"u":@"i",
                                @"v":version,
                                @"time":@(liTime),
                                @"params":paramas,
                                @"key":keymd5,
                                @"dinfo":[self getDinfo]
                                };
    return myparamses;
}

//IAP充值验证接口
+(NSString *)getVerifyPayment
{
    return [NSString stringWithFormat:@"%@value/Valid",API_URL];
    return @"http://dev.gn100.com/interface/value/Valid";
}

@end
