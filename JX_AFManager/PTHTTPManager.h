//
//  PTHTTPManager.h
//  PhantomSmart
//
//  Created by PhantomDev on 2017/8/21.
//  Copyright © 2017年 jiajianxing. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@class PTResponse;

#define PTHTTPManagerShareInstance  [PTHTTPManager shareInstanceManager]


#define PTWeakSelf __weak typeof(self) weakSelf = self
#define PTStrongSelf __strong __typeof(weakSelf)strongSelf = weakSelf;

typedef enum {
    Get = 0,
    Post,
    Put,
    Delete,
} NetworkMethod;

//数据请求回调
typedef void (^ResponseBlock) (id data, NSError *error);

@interface PTHTTPManager :AFHTTPSessionManager

+(instancetype)shareInstanceManager;

- (id)initWithBaseURL:(NSString *)Base_URL;

- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary *)params
                 withMethodType:(int)NetworkMethod
                       andBlock:(ResponseBlock)block;

/**
 取消请求

 @param url
 */
- (void)cancelHTTPOperationsWithUrl:(NSString *)url;


@end
