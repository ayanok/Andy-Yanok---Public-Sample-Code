//
//  FBRequestWrapper.h
//  Facebook Demo
//
//  Created by Andy Yanok on 3/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBConnect.h"

#define FB_APP_ID @"197366800287642"
#define FB_API_KEY @"3269fff9ef3b6fc13255e670ebb44c4d"
#define FB_APP_SECRET @"d038b12cc8632865952f69722fe26393"

@interface FBRequestWrapper : NSObject <FBRequestDelegate, FBSessionDelegate> 
{
	Facebook *facebook;
	BOOL isLoggedIn;
}

@property (nonatomic, retain) Facebook *facebook;
@property (nonatomic, assign) BOOL isLoggedIn;

+ (id) defaultManager;
- (void) setIsLoggedIn:(BOOL) _loggedIn;
- (void) FBSessionBegin:(id<FBSessionDelegate>) _delegate;
- (void) FBLogout;
- (void) getFBRequestWithGraphPath:(NSString*) _path andDelegate:(id) _delegate;
- (void) sendFBRequestWithGraphPath:(NSString*) _path params:(NSMutableDictionary*) _params andDelegate:(id) _delegate;

@end
