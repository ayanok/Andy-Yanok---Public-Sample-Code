//
//  RootViewController.h
//  Facebook Demo
//
//  Created by Andy Yanok on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StatusViewController.h"
#import "PostLinkViewController.h"
#import "PostPhotoViewController.h"
#import "FriendsListViewController.h"

@interface RootViewController : UITableViewController
{
	NSArray *postList;
}

@end
