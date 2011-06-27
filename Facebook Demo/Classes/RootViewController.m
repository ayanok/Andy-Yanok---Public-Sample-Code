//
//  RootViewController.m
//  Facebook Demo
//
//  Created by Andy Yanok on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"


@implementation RootViewController


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Facebook Demo";
	
	postList = [NSArray arrayWithObjects:@"Status Post", @"Post A Link", @"Post A Photo", @"Friends List With Blocks", nil];
	[postList retain];
}


#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [postList count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	cell.textLabel.text = [postList objectAtIndex:indexPath.row];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

	switch (indexPath.row) {
		case 0:
		{
			StatusViewController *status = [[StatusViewController alloc] init];
			[self.navigationController pushViewController:status animated:YES];
			[status release];
			break;
		}
		case 1:
		{
			PostLinkViewController *link = [[PostLinkViewController alloc] init];
			[self.navigationController pushViewController:link animated:YES];
			[link release];
			break;
		}
		case 2:
		{
			PostPhotoViewController *photo = [[PostPhotoViewController alloc] init];
			[self.navigationController pushViewController:photo animated:YES];
			[photo release];
			break;
		}
        case 3:
        {
            FriendsListViewController *friends = [[FriendsListViewController alloc] init];
            [self.navigationController pushViewController:friends animated:YES];
            [friends release];
        }
		default:
			break;
	}
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[postList release];
    [super dealloc];
}


@end

