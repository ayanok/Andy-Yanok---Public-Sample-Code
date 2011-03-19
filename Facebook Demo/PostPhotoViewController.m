//
//  ScreenShotViewController.m
//  Facebook Demo
//
//  Created by Andy Yanok on 3/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PostPhotoViewController.h"


@implementation PostPhotoViewController
@synthesize txtCaption, imageView;

- (IBAction) btnPostPress:(id) sender {
	
	[self.txtCaption resignFirstResponder];
	
	//we will release this object when it is finished posting
	FBFeedPost *post = [[FBFeedPost alloc] initWithPhoto:self.imageView.image name:self.txtCaption.text];
	[post publishPostWithDelegate:self];
	
	IFNNotificationDisplay *display = [[IFNNotificationDisplay alloc] init];
	display.type = NotificationDisplayTypeLoading;
	display.tag = NOTIFICATION_DISPLAY_TAG;
	[display setNotificationText:@"Posting Photo..."];
	[display displayInView:self.view atCenter:CGPointMake(self.view.center.x, self.view.center.y-100.0) withInterval:0.0];
	[display release];
}

#pragma mark -
#pragma mark FBFeedPostDelegate

- (void) failedToPublishPost:(FBFeedPost*) _post {

	UIView *dv = [self.view viewWithTag:NOTIFICATION_DISPLAY_TAG];
	[dv removeFromSuperview];
	
	IFNNotificationDisplay *display = [[IFNNotificationDisplay alloc] init];
	display.type = NotificationDisplayTypeText;
	[display setNotificationText:@"Failed To Post"];
	[display displayInView:self.view atCenter:CGPointMake(self.view.center.x, self.view.center.y-100.0) withInterval:1.5];
	[display release];
	
	//release the alloc'd post
	[_post release];
}

- (void) finishedPublishingPost:(FBFeedPost*) _post {

	UIView *dv = [self.view viewWithTag:NOTIFICATION_DISPLAY_TAG];
	[dv removeFromSuperview];
	
	IFNNotificationDisplay *display = [[IFNNotificationDisplay alloc] init];
	display.type = NotificationDisplayTypeText;
	[display setNotificationText:@"Finished Posting"];
	[display displayInView:self.view atCenter:CGPointMake(self.view.center.x, self.view.center.y-100.0) withInterval:1.5];
	[display release];
	
	//release the alloc'd post
	[_post release];
}

#pragma mark -
#pragma mark LoadView

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = @"Post A Photo";
	
	UIBarButtonItem *btnPost = [[UIBarButtonItem alloc] initWithTitle:@"Post" style:UIBarButtonItemStyleBordered 
															   target:self action:@selector(btnPostPress:)];
	self.navigationItem.rightBarButtonItem = btnPost;
	[btnPost release];
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[txtCaption release];
	[imageView release];
    [super dealloc];
}


@end
