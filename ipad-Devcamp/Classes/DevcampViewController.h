//
//  DevcampViewController.h
//  Devcamp
//
//  Created by Karl von Randow on 1/05/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultsViewController.h"

@interface DevcampViewController : UIViewController {
	IBOutlet UILabel *question;
	IBOutlet UISegmentedControl *answers;
	IBOutlet UIButton *next;
	IBOutlet ResultsViewController *resultsViewController;
	IBOutlet UILabel *l1, *l2;
	
	NSMutableArray *questions;
	NSUInteger questionIndex;
	
	NSMutableArray *answerResults;
}

- (IBAction)goNext;

- (void)addQuestion:(NSString*)questionText;

@property (readonly,nonatomic) NSMutableArray *answerResults;
@property (readonly,nonatomic) NSArray *questions;

@end

