//
//  ResultsViewController.m
//
//  Created by Karl von Randow on 1/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ResultsViewController.h"

#import "DevcampViewController.h"

@implementation ResultsViewController

@synthesize dev;


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)viewWillAppear:(BOOL)animated {
	NSMutableString *buf = [NSMutableString stringWithCapacity:1000];
	
	
	[buf appendFormat:@"<html><head></head><body bgcolor=\"#333333\" text=\"#ffffff\">"];
	NSArray *questions = dev.questions;
	int i = 0;
	for (NSString *question in questions) {
		NSArray *answers = [dev.answerResults objectAtIndex:i];
		
		float total = 0;
		int n = 0;
		for (NSNumber *answer in answers) {
			total += ([answer floatValue] + 1);
			n++;
		}
		
		float avg = total / n;
		
		[buf appendFormat:@"<p style='font-size:24px'><b>%@:</b><br />Average %2.2f</p>", question, avg];
		
		i++;
	}
	[buf appendFormat:@"</body></html>"];
	
	[resultsView loadHTMLString:buf baseURL:nil];
}

- (IBAction)goStartOver {
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction)goSuggest {
	suggestViewController.modalTransitionStyle = UIModalTransitionStylePartialCurl;
	suggestViewController.dev = dev;
	[self presentModalViewController:suggestViewController animated:YES];
}

@end
