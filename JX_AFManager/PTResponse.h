//
//  PTResponse.h
//  PhantomSmart
//
//  Created by 贾 on 2017/3/2.
//  Copyright © 2017年 PhantomSmart. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PTResponse;
typedef void(^PTServerRequestCompleteBlock)(PTResponse *response);

@interface PTResponse : NSObject

@property(nonatomic, strong)id content;

/*error msg */
@property (strong, nonatomic) NSString  *errorMsg;
@property(nonatomic, assign)BOOL success;

+ (PTResponse *)parserResponseWithDic:(NSDictionary *)dict error:(NSError *)error;

@end
