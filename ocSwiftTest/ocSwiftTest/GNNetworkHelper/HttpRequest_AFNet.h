//
//  HttpRequest_AFNet.h
//  DuoDianLife
//
//  Created by xu on 15/4/15.
//  Copyright (c) 2015年 ASOU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "SVProgressHUD.h"

@interface HttpRequest_AFNet : NSObject

//+ (void)requestPOST_JSONwithURLstring:(NSString *)URLstr success:(void(^)(id JsonInfo))success failure:(void(^)(NSError *dataError))failure;
//
//
//+ (void)requestPOST_JSONwithURLstring:(NSString *)URLstr parameters:(NSDictionary *)parameters success:(void(^)(id JsonInfo))success failure:(void(^)(NSError *dataError))failure;

+ (AFHTTPRequestOperation *)requestPOST_JSONwithURLstringIsTeturn:(NSString *)URLstr parameters:(NSDictionary *)parameters success:(void(^)(id JsonInfo))success failure:(void(^)(NSError *dataError))failure;

+ (void)requestPOST_JSONwithURLstring:(NSString *)URLstr parameters:(NSDictionary *)parameters success:(void(^)(id JsonInfo))success commonFailure:(void(^)(NSError *dataError))failure;

+ (void)requestGET_JsonWithUrlstring:(NSString *)URLstr parameters:(NSDictionary *)parameters success:(void (^)(id JsonInfo))successs failurl:(void (^)(void))failure;


+ (void)requestGET_JsonWithUrlstring:(NSString *)URLstr success:(void(^)(id JsonInfo))successs failurl:(void (^)(void))failure;


+ (void)requestGCDwithURLstring:(NSString *)URLstr success:(void (^)(NSDictionary *success))success;

+ (void)requestPOST_JSONwithURLstringAndError:(NSString *)URLstr parameters:(NSDictionary *)parameters success:(void (^)(id JsonInfo))success failure:(void (^)(NSError *error))failure;

+ (void)requestPost_SystemwithURlStriing:(NSString *)urlStr parameters:(NSDictionary *)parameters success:(void (^)(NSDictionary *))success;

@end
