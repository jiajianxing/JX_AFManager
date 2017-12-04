//
//  PTResponse.m
//  PhantomSmart
//
//  Created by 贾 on 2017/3/2.
//  Copyright © 2017年 PhantomSmart. All rights reserved.
//

#import "PTResponse.h"

@implementation PTResponse

+ (PTResponse *)parserResponseWithDic:(NSDictionary *)dict error:(NSError *)error
{
    PTResponse *response = [[PTResponse alloc] init];
    if ([dict isKindOfClass:[NSArray class]]) {
        response.content = dict;
        response.success = YES;
        response.errorMsg = nil;
        return response;
    }
    NSString *success = [NSString stringWithFormat:@"%@",dict[@"success"]];
//    NSLog(@"Response  = %@", dict);
    if (error || !dict|| [success isEqualToString:@"0"]|| ([[dict objectForKey:@"code"] integerValue] != 200 && [[dict objectForKey:@"code"] integerValue] != 0)) {
        response.success = NO;
        response.content = nil;
        response.errorMsg = dict[@"msg"];
        if (error) {
            NSData *errorData = error.userInfo[@"com.alamofire.serialization.response.error.data"];
            if (errorData) {
                NSDictionary *errorInfo = [NSJSONSerialization JSONObjectWithData:errorData options:NSJSONReadingMutableContainers error:nil];
                if (errorInfo[@"msg"]) {
                    response.errorMsg = errorInfo[@"msg"];
                } else if (errorInfo[@"message"]){
                    response.errorMsg =errorInfo[@"message"];
                } else if (errorInfo[@"error"]){
                    response.errorMsg = errorInfo[@"error"];
                }else if(errorInfo[@"errors"]) {
                    response.errorMsg = errorInfo[@"errors"];
                } else {
                    if (errorInfo) {
                        response.errorMsg = errorInfo.allValues[0];
                    }
                }
            } else {
                response.errorMsg = error.userInfo[@"NSLocalizedDescription"];
            }
        }
        if (!response.errorMsg || response.errorMsg.length == 0) {
            response.errorMsg = @"请求服务器失败";
        }
    }
    if (!error || (dict && ([[dict objectForKey:@"code"] integerValue] == 200 || [success isEqualToString:@"1"]))) {
        response.success = YES;
        response.content = dict;
        response.errorMsg = nil;
    }
    
    return response;
}


@end

