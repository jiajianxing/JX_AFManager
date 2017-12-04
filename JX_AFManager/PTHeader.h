//
//  PTHeader.h
//  Pods
//
//  Created by PhantomDev on 2017/12/4.
//

#ifndef PTHeader_h
#define PTHeader_h

#import "PTResponse.h"
#import "PTHTTPManager.h"


#define  PTServerRequest(path,parameter,method)\
[PTHTTPManagerShareInstance requestJsonDataWithPath:path withParams:parameter withMethodType:method andBlock:^(id data, NSError *error) {\
if(completeResponse){\
completeResponse([PTResponse parserResponseWithDic:data error:error]);\
}\
}];\



#endif /* PTHeader_h */
