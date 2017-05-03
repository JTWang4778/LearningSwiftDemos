//
//  HttpRequest_AFNet.m
//  DuoDianLife
//
//  Created by xu on 15/4/15.
//  Copyright (c) 2015年 ASOU. All rights reserved.
//

#import "HttpRequest_AFNet.h"
@implementation HttpRequest_AFNet
+ (void)requestPOST_JSONwithURLstring:(NSString *)URLstr success:(void (^)(id JsonInfo))success failure:(void (^)(NSError *dataError))failure{
    [self requestPOST_JSONwithURLstring:URLstr parameters:nil success:success failure:failure];
        
}
+ (NSString *)generateGETAbsoluteURL:(NSString *)url params:(id)params {
    if (params == nil || ![params isKindOfClass:[NSDictionary class]] || [params count] == 0) {
        return url;
    }
    
    NSString *queries = @"";
    for (NSString *key in params) {
        id value = [params objectForKey:key];
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            continue;
        } else if ([value isKindOfClass:[NSArray class]]) {
            continue;
        } else if ([value isKindOfClass:[NSSet class]]) {
            continue;
        } else {
            queries = [NSString stringWithFormat:@"%@%@=%@&",
                       (queries.length == 0 ? @"&" : queries),
                       key,
                       value];
        }
    }
    
    if (queries.length > 1) {
        queries = [queries substringToIndex:queries.length - 1];
    }
    
    if (([url hasPrefix:@"http://"] || [url hasPrefix:@"https://"]) && queries.length > 1) {
        if ([url rangeOfString:@"?"].location != NSNotFound
            || [url rangeOfString:@"#"].location != NSNotFound) {
            url = [NSString stringWithFormat:@"%@%@", url, queries];
        } else {
            queries = [queries substringFromIndex:1];
            url = [NSString stringWithFormat:@"%@?%@", url, queries];
        }
    }
    
    return url.length == 0 ? queries : url;
}
+ (void)requestPOST_JSONwithURLstring:(NSString *)URLstr parameters:(NSDictionary *)parameters success:(void (^)(id))success commonFailure:(void (^)(NSError *))failure{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",nil];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 30.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    [manager POST:URLstr parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
           NSLog(@"URL ====>>>> %@",[self generateGETAbsoluteURL:URLstr params:parameters]);
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//         [SVProgressHUD dismiss];
        if (failure) {
            AFNetworkReachabilityManager * manager = [AFNetworkReachabilityManager sharedManager];
            if (manager.networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable) {
                [SVProgressHUD showImage:nil status:@"网络异常，请检查网络"];
                
            }else{
                [SVProgressHUD showImage:nil status:@"服务器连接异常"];
            }
            failure(error);
        }
    }];
}
+ (void)requestPOST_JSONwithURLstring:(NSString *)URLstr parameters:(NSDictionary *)parameters success:(void (^)(id JsonInfo))success failure:(void (^)(NSError *dataError))failure{
    
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",nil];
        [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        manager.requestSerializer.timeoutInterval = 30.f;
        [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        [manager POST:URLstr parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (success) {
                success(responseObject);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (failure) {
                failure(error);
                [SVProgressHUD dismiss];
            }
        }];
}
+ (AFHTTPRequestOperation *)requestPOST_JSONwithURLstringIsTeturn:(NSString *)URLstr parameters:(NSDictionary *)parameters success:(void(^)(id JsonInfo))success failure:(void(^)(NSError *dataError))failure {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",nil];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 30.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
  AFHTTPRequestOperation *operaton = [manager POST:URLstr parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
            [SVProgressHUD dismiss];
        }
    }];
    return operaton;
}
+ (void)requestPOST_JSONwithURLstringAndError:(NSString *)URLstr parameters:(NSDictionary *)parameters success:(void (^)(id JsonInfo))success failure:(void (^)(NSError *error))failure {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain",nil];
    [manager POST:URLstr parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
            //NSLog(@"服务器返回数据 %@", responseObject);
            
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
            //NSLog(@"error------ %@",error);
        }
    }];

}



+ (void)requestGET_JsonWithUrlstring:(NSString *)URLstr success:(void (^)(id JsonInfo))successs failurl:(void (^)(void))failure{
    [self requestGET_JsonWithUrlstring:URLstr parameters:nil success:successs failurl:failure];
}
+ (void)requestGET_JsonWithUrlstring:(NSString *)URLstr parameters:(NSDictionary *)parameters success:(void (^)(id JsonInfo))successs failurl:(void (^)(void))failure{
    AFHTTPRequestOperationManager *massage = [AFHTTPRequestOperationManager manager];
    [massage GET:URLstr parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (successs) {
            successs(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure();
        }
    }];
}


+(void)requestGCDwithURLstring:(NSString *)URLstr success:(void (^)(NSDictionary *))success{
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSURL *zoneUrl = [NSURL URLWithString:URLstr];
//        NSString *zoneStr = [NSString stringWithContentsOfURL:zoneUrl encoding:NSUTF8StringEncoding error:nil];
//        NSData *data = [zoneStr dataUsingEncoding:NSUTF8StringEncoding];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if (data) {
//                NSDictionary *dicc = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//                success(dicc);
//            }
//        });
//    });
//    dispatch_async(dispatch_get_main_queue(), ^{
        NSURL *zoneUrl = [NSURL URLWithString:URLstr];
                NSString *zoneStr = [NSString stringWithContentsOfURL:zoneUrl encoding:NSUTF8StringEncoding error:nil];
                NSData *data = [zoneStr dataUsingEncoding:NSUTF8StringEncoding];
        if (data) {
                            NSDictionary *dicc = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                            success(dicc);
                        }
//    });
}
@end
