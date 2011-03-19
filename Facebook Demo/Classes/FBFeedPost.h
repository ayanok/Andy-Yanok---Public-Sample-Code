//
//  FBFeedPost.h
//  Facebook Demo
//
//  Created by Andy Yanok on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBRequestWrapper.h"

@protocol FBFeedPostDelegate;

typedef enum {
  FBPostTypeStatus = 0,
  FBPostTypePhoto = 1,
  FBPostTypeLink = 2
} FBPostType;

@interface FBFeedPost : NSObject <FBRequestDelegate, FBSessionDelegate>
{
	NSString *url;
	NSString *message;
	NSString *caption;
	UIImage *image;
	FBPostType postType;
	
	id <FBFeedPostDelegate> delegate;
}

@property (nonatomic, assign) FBPostType postType;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *message;
@property (nonatomic, retain) NSString *caption;
@property (nonatomic, retain) UIImage *image;

@property (nonatomic, assign) id <FBFeedPostDelegate> delegate;

- (id) initWithLinkPath:(NSString*) _url caption:(NSString*) _caption;
- (id) initWithPostMessage:(NSString*) _message;
- (id) initWithPhoto:(UIImage*) _image name:(NSString*) _name;
- (void) publishPostWithDelegate:(id) _delegate;

@end


@protocol FBFeedPostDelegate <NSObject>
@required
- (void) failedToPublishPost:(FBFeedPost*) _post;
- (void) finishedPublishingPost:(FBFeedPost*) _post;
@end