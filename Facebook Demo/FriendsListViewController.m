//
//  FriendsListViewController.m
//  Facebook Demo
//
//  Created by Andrew Yanok on 6/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FriendsListViewController.h"

@implementation FriendsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FBRequestWrapper *wrapper = [FBRequestWrapper defaultManager];
    
    NSMutableDictionary *params = [[[NSMutableDictionary alloc] init] autorelease];
    [wrapper.facebook requestWithGraphPath:@"me/friends" 
                                    params:params 
                                    method:@"GET" 
                                  callback:^(FBRequest *request, id result, NSError *error) 
    {
        if ([result isKindOfClass:[NSArray class]]) {
            [table reloadData];
        }
        
    }];
    
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{	
	return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	return 0;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    
	
	return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 0.0;
}

- (CGFloat)tableView:(UITableView *)tableView 
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 44.0;
}

- (NSIndexPath *)tableView:(UITableView *)tableViewwillSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	return indexPath;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
	return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) dealloc {
    [table release];
    [super dealloc];
}


@end
