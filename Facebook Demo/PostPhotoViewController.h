//
//  ScreenShotViewController.h
//  Facebook Demo
//
//  Created by Andy Yanok on 3/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBFeedPost.h"
#import "IFNNotificationDisplay.h"

@interface PostPhotoViewController : UIViewController <FBFeedPostDelegate> {
	IBOutlet UITextView *txtCaption;
	IBOutlet UIImageView *imageView;
}

@property (nonatomic, retain) IBOutlet UITextView *txtCaption;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

- (IBAction) btnPostPress:(id) sender;

@end
