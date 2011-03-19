//
//  IFNNotificationDisplay.m
//  iFlashCardPro
//
//  Created by Andy Yanok on 2/19/11.
//  Copyright 2011 Andrew Yanok. All rights reserved.
//

#import "IFNNotificationDisplay.h"


@implementation IFNNotificationDisplay
@synthesize type;

- (id) init {
	self = [super initWithFrame:CGRectMake(0.0, 0.0, 100.0, 100.0)];
	if (self) {
		
		self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:.7];
		self.layer.cornerRadius = 5.0;
		
		lblDisplay = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 100.0, 100.0)];
		lblDisplay.backgroundColor = [UIColor clearColor];
		lblDisplay.textColor = [UIColor whiteColor];
		lblDisplay.font = [UIFont fontWithName:@"Helvetica-Bold" size:15.0];
		lblDisplay.textAlignment = UITextAlignmentCenter;
		lblDisplay.adjustsFontSizeToFitWidth = YES;
		[self addSubview:lblDisplay];
		
		activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
		activity.hidesWhenStopped = YES;
		activity.center = self.center;
		[self addSubview:activity];
	}
	
	return self;
}

- (void) setNotificationText:(NSString*) _text {
	lblDisplay.text = _text;
}

- (void) displayInView:(UIView*) _view atCenter:(CGPoint) _center withInterval:(float) _interval {
	self.center = _center;
	[_view addSubview:self];
	
	if (type == NotificationDisplayTypeText) {
		[self performSelector:@selector(removeNotification) withObject:nil afterDelay:_interval];
	} else { //loading
		lblDisplay.frame = CGRectMake(0.0, 80.0, self.bounds.size.width, 20.0);
		if ([lblDisplay.text length] == 0)
			lblDisplay.text = @"Loading...";
		[activity startAnimating];
	}

}

- (void) removeNotification {
	CATransition *animation = [CATransition animation];
	[animation setType:kCATransitionFade];
	[animation setSubtype:kCATransitionFromRight];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	[self.layer addAnimation:animation forKey:@"EaseOut"];
	self.hidden = YES;
	
	[self performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:.5];
}



- (void)dealloc {
	[activity release];
	[lblDisplay release];
    [super dealloc];
}


@end
