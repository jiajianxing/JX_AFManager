//
//  PTRequest.m
//  JX_AFManager
//
//  Created by PhantomDev on 2017/12/4.
//

#import "PTRequest.h"
#import "PTHeader.h"

@implementation PTRequest

- (void)queryList:(PTServerRequestCompleteBlock)completeResponse
{
    PTServerRequest(@"", nil, Get)
}

@end
