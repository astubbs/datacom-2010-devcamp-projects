//
//  SuggestViewController.m
//
//  Created by Karl von Randow on 2/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SuggestViewController.h"

#import "DevcampViewController.h"

@implementation SuggestViewController

@synthesize dev;

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (IBAction) doAdd {
	NSString *text = textField.text;
	[dev addQuestion:text];
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction) doCancel {
	[self dismissModalViewControllerAnimated:YES];
}

@end
