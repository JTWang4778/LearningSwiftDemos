//
//  NetworkPort.h
//  GN100
//
//  Created by 侯钦哲 on 15/8/11.
//  Copyright (c) 2015年 侯钦哲. All rights reserved.
#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
#import <sys/sysctl.h>
#import <net/if.h>
#import <net/if_dl.h>
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import "HttpConstant.h"
#import "SVProgressHUD.h"
#import "SBJson.h"
typedef NS_ENUM(NSInteger, APIEnum) {
    
    API_LOGIN = 0,
    API_LOGIN_SMS,
    API_LOGIN_CODE,
    API_LOGIN_CHECKCODE,
    API_LOGIN_REGISTER,
    API_LOGIN_QQ,
    API_LOGIN_BIND,
    API_LOGIN_USERNAME,
    API_SIGNIN,
    API_PERSON_DATA,
    API_HOME,
    API_CATEGORY,
    API_PERSON_CENTER,
    API_COURSE_CATALOG,
    API_COURSE_COMMENT,
    API_COURSE_FILTER,
    API_COURSE_SUMMARY,
    API_COURSE_PREFILE,
    API_Interest,
    API_COURSE_DETAIL,
    API_COURSE_ADDFAVOR,
    API_COURSE_DELFAVOR,
    API_COURSE_FAVORLIST,
    API_COURSE_DELCOMMENT,
    API_EVALUATTE,
    API_COURSE_ADDREG,
    API_TEACHER_INFO,
    API_TEACHER_COMMENT,
    API_TEACHER_ADDFAV,
    API_TEACHER_TASKLIST,
    API_TEACHER_COURSECLASS,
    API_TEACHER_PUBLISHTASK,
    API_TEACHER_UPLOADIMAGE,
    API_SEARCH,
    API_MESSAGE_GETLIST,
    API_MESSAGE_GETNUM,
    API_MESSAGE_ADDMESSAGE,
    API_MESSAGE_CHATSINGLE,
    API_PERSON_SETINFO,
    API_PERSON_UPDATEURL,
    API_PERSON_GETINFO,
    API_PLAN_INFO,
    API_LIVE_PLAN_INFO,
    API_PLAN_GETMYCOMMENT,
    API_PLAN_COMMENTSTATUS,
    API_PLAY_ADDNOTE,
    API_PLAY_DELNOTE,
    API_PLAY_UPDATENOTE,
    API_PLAY_GETNOTES,
    API_PLAY_GETNOTICES,
    API_PLAY_GETPUBLICNOTICE,
    API_TEACHER_GET_NOTICE,
    API_TEACHER_ADD_EDIT_DELETE_NOTICE,
    API_TEACHER_START_PUSH,
    API_TEACHER_CLOSE_PUSH,
    API_STUDENT_CALENDAR,
    API_CUSTOMNAVI,
    API_LIVETABLE,
    API_LATELIVELIST,
    API_HOME_TEACHER,
    API_USER_SIGN,
    API_TEACHERSEARCHER,
    API_CHECKTOKEN,
    API_TEAHCER_WORK_DETAIL,
    API_TEACHER_WORK_REPLYDETAIL,
    API_TEACHER_PUSHMESSAGE
    
};

static NSString * salt = @"gn1002015";
@interface NetworkPort : AFHTTPSessionManager

+ (NSString *)getAPI:(APIEnum)apiEnum;
+ (NSDictionary *)getParams:(NSDictionary *)params;
+ (NSDictionary *)getDinfo;
+ (NSDictionary *)getLoginParams:(NSString *)userName andPassword:(NSString *)password;
//我的订单列表
+(NSDictionary *)getOrderParames:(NSString *)Ouid status:(NSString *)OStatus token:(NSString *)token page:(NSNumber * )page length:(NSNumber * )length;

//+(NSDictionary *)getOrderParames:(NSString *)Ouid status:(NSString *)OStatus page:(NSNumber * )page length:(NSNumber * )length;
/*** 根据planId获取上课通知信息*/
+(NSDictionary *)getClassNotificationRelust:(NSString *)plan_id uid:(NSString *)uid content:(NSString *)content type:(NSInteger)type user_from_id:(NSString *)user_from_id userToken:(NSString *)userToken;
/***  上课页统一发送通知Url*/
+(NSString *)goClassPostNotificationByPlanId;


//删除某个订单
+(NSDictionary *)deleteOrderParames:(NSString *)orderId;
/***删除某个订单详情*/
+(NSString *)deleteOrderDetail;
//取消某个订单
+(NSString *)cancelOrderDetail;
//取消某个订单
+(NSDictionary *)cancelOrderParames:(NSString *)OrderId;
//下订单
+(NSDictionary *)getOrderOuid:(NSString *)Ouid objectId:(NSNumber *)objectId token:(NSString *)token ext:(NSNumber * )ext objectType:(NSNumber * )objectType;
//我的会员中心
+(NSDictionary *)getVIPParames:(NSString *)Ouid token:(NSString *)token;
//会员中心地址
+(NSString *)getVIPCenter;
//学生作业列表
+(NSString *)getStudentTaskList;
//未提交作业详情页
+(NSString *)getStudentNoCommitList;
//待批改作业详情页
+(NSString *)getWaitToCheckDetail;
//已批改作业详情页
+(NSString *)getAlreadyCheckDetail;
//上传图片
+(NSString *)getUploadImage;
//上传作业
+(NSString *)getCommitTask;
//会员课程列表
+(NSDictionary *)getOrderOuid:(NSString *)Ouid memberId:(NSString *)memberId token:(NSString *)token page:(NSNumber * )page length:(NSNumber * )length;
//生成订单
+(NSDictionary *)getAddOrderlWithObjectType:(NSNumber *)objectType   objectId:(NSNumber *)objectId ext:(NSNumber *)ext uid:(NSString *)uid token:(NSString *)token;
//生成订单地址
+(NSString *)getAddOrder;
//获得订单详情
+(NSDictionary *)getOrderDetailWithUserId:(NSString *)uid OrderId:(NSString *)orderId objectType:(NSNumber *)objectType token:(NSString *)token;
//云点支付请求
+(NSDictionary *)getYunPayWithUserId:(NSString *)uid OrderId:(NSString *)orderId objectType:(NSNumber *)objectType;
//IAP充值验证
+(NSDictionary *)getVerifyPaymentWithUserId:(NSString *)uid transactionId:(NSString *)transactionId andPayCert:(NSString *)payCert;
//获得订单详情地址
+(NSString *)getOrderDetail;
//获得商品地址
+(NSString *)getProducts;
//获得商品详情
+(NSDictionary *)getProductsWithUserId:(NSString *)uid;
//会员套餐课程列表
+(NSString *)getCourseList;
//下订单
+(NSString *)getConfirmOrder;
//我的订单列表
+(NSString *)getOrderInfo;
//答案统计
+(NSString *)getAddAnswerLog;
//云点支付地址
+(NSString *)getYunPay;
//获得题目Id
+(NSString *)getQuestionId;
//获得学生列表
+(NSString *)getStudentList;
//IAP充值验证接口
+(NSString *)getVerifyPayment;

- (NSString *)md5ForParamas:(NSDictionary *)paramas time:(int) aiTime;
- (int) getDateByInt;
- (NSString *)version;

// 返回请求课程播放信息的接口地址
//+ (NSString *)getCourseVideoInfoUrl;
+ (NSDictionary *)getParamsDictionary:(NSDictionary *)params;

+ (NSString *)gn_getHost;
+ (NSString *)gn_getSocket_URL;
+ (NSString *)gn_getSocket_Image;
@end
