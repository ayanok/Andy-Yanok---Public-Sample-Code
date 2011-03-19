//
//  FBImageView.m
//  FBP
//
//  Created by David Stanfill on 12/7/10.
//  Copyright 2010 USN. All rights reserved.
//

#import "FBImageView.h"


@implementation FBImageView


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		loaded = NO;
		loading = NO;
		data = [[NSMutableData alloc] initWithLength:32768];
    }
    return self;
}

- (void) load {
	
	NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
							 
	if ([NSURLConnection canHandleRequest:request]) {
		[connection release];
		connection = [[NSURLConnection connectionWithRequest:request delegate:self] retain];
	}
}

- (void) cancelLoad {
	[connection cancel];
	[connection release];
	connection = nil;
}

- (void) setUrl:(NSString *)newURL {
	if (url != newURL && ![url isEqual:newURL]) {
		[url release];
		url = [newURL retain];
		
		[self cancelLoad];
		[self load];
	}
}


- (void) didMoveToSuperview {
	if (self.superview) {
		if (!loaded && !loading) {
			// Start the load
		}
	} else {
		// Cancel load?
	}
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	loading = NO;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	[data setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)newdata {
	[data appendData:newdata];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	loading = NO;
	loaded = YES;
	UIImage * image = [UIImage imageWithData:data];
	if (image) {
		self.image = image;
		[self sizeToFit];
		// Self.superview should normally be a cell content view - self.superview.superview is therefore the cell view
		if (self.superview.superview) {
			[self.superview.superview setNeedsLayout];
		}
	}
	[data setLength:0];
}

- (void)dealloc {
	[connection cancel];
	[connection release];
    [super dealloc];
}


@end
