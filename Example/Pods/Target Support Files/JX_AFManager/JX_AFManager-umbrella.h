#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "PTHeader.h"
#import "PTHTTPManager.h"
#import "PTRequest.h"
#import "PTResponse.h"

FOUNDATION_EXPORT double JX_AFManagerVersionNumber;
FOUNDATION_EXPORT const unsigned char JX_AFManagerVersionString[];

