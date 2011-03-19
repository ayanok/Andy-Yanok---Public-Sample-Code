//
//  PostLinkViewController.h
//  Facebook Demo
//
//  Created by Andy Yanok on 3/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBFeedPost.h"
#import "IFNNotificationDisplay.h"

@interface PostLinkViewController : UIViewController <FBFeedPostDelegate> {
	IBOutlet UITextField *txtLink;
	IBOutlet UITextView *txtCaption;
}

@property (nonatomic, retain) IBOutlet UITextField *txtLink;
@property (nonatomic, retain) IBOutlet UITextView *txtCaption;

- (IBAction) btnPostPress:(id) sender;

@end
