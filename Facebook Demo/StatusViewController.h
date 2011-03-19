//
//  StatusViewController.h
//  Facebook Demo
//
//  Created by Andy Yanok on 3/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBFeedPost.h"
#import "IFNNotificationDisplay.h"

@interface StatusViewController : UIViewController <FBFeedPostDelegate> {
	IBOutlet UITextView *txtView;
}

@property (nonatomic, retain) IBOutlet UITextView *txtView;

- (IBAction) btnPostPress:(id) sender;

@end
