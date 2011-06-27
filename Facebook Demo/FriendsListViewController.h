//
//  FriendsListViewController.h
//  Facebook Demo
//
//  Created by Andrew Yanok on 6/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBRequestWrapper.h"

@interface FriendsListViewController : UIViewController
{
    IBOutlet UITableView *table;
    NSArray *friendsList;
}

@end
