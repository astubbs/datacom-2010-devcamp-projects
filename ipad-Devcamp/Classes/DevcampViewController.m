//
//  DevcampViewController.m
//  Devcamp
//
//  Created by Karl von Randow on 1/05/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "DevcampViewController.h"

@implementation DevcampViewController

@synthesize answerResults;
@synthesize questions;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	questions = [NSMutableArray arrayWithObjects:@"I clearly understand how I can progress in my workplace", 
				 @"I have a nemesis at work",
				 @"I get enough training and mentoring in my work",
				 @"I like the taste of freshly roasted graduate developers",
				 @"I am physically attracted to my direct manager",
				 @"Friday drinks aren't over until you fall over",
				 nil];
	[questions retain];
	answerResults = [[NSMutableArray alloc] initWithCapacity:5];
	for (NSString *question in questions) {
		[answerResults addObject:[[NSMutableArray alloc] initWithCapacity:5]];
	}
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)viewDidAppear:(BOOL)animated {
	question.text = [questions objectAtIndex:questionIndex];
}

- (IBAction)goNext {
	NSMutableArray *a = [answerResults objectAtIndex:questionIndex];
	[a addObject:[NSNumber numberWithInt:answers.selectedSegmentIndex]];
	
	questionIndex++;
	if (questionIndex >= [questions count]) {
		resultsViewController.dev = self;
		resultsViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
		[self presentModalViewController:resultsViewController animated:YES];
		
		questionIndex = 0;
	
	} else {
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.25];
		question.alpha = l1.alpha = l2.alpha = answers.alpha = next.alpha = 0;
		[UIView commitAnimations];
		
		
	}
	[NSTimer scheduledTimerWithTimeInterval:0.25 target:self selector:@selector(nextQuestion:) userInfo:nil repeats:NO];
	
}

- (void)nextQuestion:(NSTimer*)t {
	NSNumber *n = [NSNumber numberWithInt:1];
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.25];
	question.alpha = l1.alpha = l2.alpha = answers.alpha = next.alpha = 1;
	[UIView commitAnimations];
	question.text = [questions objectAtIndex:questionIndex];
	NSLog(@"%@", n);
}

- (void)addQuestion:(NSString*)questionText {
	[questions addObject:questionText];
	[answerResults addObject:[NSMutableArray arrayWithCapacity:10]];
}

- (void)dealloc {
	[questions release];
	[answerResults release];
    [super dealloc];
}

@end
