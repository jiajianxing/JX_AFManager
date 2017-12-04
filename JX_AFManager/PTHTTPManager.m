//
//  PTHTTPManager.m
//  PhantomSmart
//
//  Created by PhantomDev on 2017/8/21.
//  Copyright © 2017年 jiajianxing. All rights reserved.
//

#import "PTHTTPManager.h"


@implementation PTHTTPManager


/**
 单例化请求类

 @return
 */
+(instancetype)shareInstanceManager
{
    static PTHTTPManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[PTHTTPManager alloc] initWithBaseURL:@""];
    });
    return manager;
}

/**
 * 初始化主URL  头信息
 */
- (id)initWithBaseURL:(NSString *)Base_URL
{
    
    self = [super initWithBaseURL:[NSURL URLWithString:Base_URL]];
    
    if (!self) {
        return nil;
    }
    [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    self.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringCacheData;
    /**分别设置请求以及相应的序列化器*/
    self.requestSerializer = [AFHTTPRequestSerializer serializer];
    AFJSONResponseSerializer *response = [AFJSONResponseSerializer serializer];
    //防止NSNull型崩溃
    response.removesKeysWithNullValues = YES;
    [self setResponseSerializer:response];
    
    
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyAlways];

    //设置请求时间
    [self.requestSerializer setTimeoutInterval:60];
    
    
    
    return self;
}

- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary  *)params
                 withMethodType:(int)NetworkMethod
                       andBlock:(ResponseBlock)block {
    aPath = [aPath stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    id failure = ^(NSURLSessionDataTask *task, NSError *error){
        if (block) {
            block(nil,error);
        }
    };
    id success = ^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject){
        if (block) {
            block(responseObject,nil);
        }
    };
    
    switch (NetworkMethod) {
            case Get: {
                [self GET:aPath parameters:params progress:nil success:success failure:failure];
                break;
            }
            case Post: {
                [self POST:aPath parameters:params progress:nil success:success failure:failure];
                break;
            }
            case Put: {
                [self PUT:aPath parameters:params success:success failure:failure];
                break;
            }
            case Delete: {
                [self DELETE:aPath parameters:params success:success failure:failure];
                break;
            }

        default:
            break;
    }
    
}


- (void)cancelHTTPOperationsWithUrl:(NSString *)url
{
    NSURL *URL = [NSURL URLWithString:url];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSURLSessionDataTask *task = [manager GET:URL.absoluteString parameters:nil  progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSLog(@"JSON: %@", responseObject);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
        
    }];
    
    //取消单个请求
    
    [task cancel];
    
    
}

@end
