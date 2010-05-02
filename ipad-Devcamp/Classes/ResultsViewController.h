//
//  ResultsViewController.h
//
//  Created by Karl von Randow on 1/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "SuggestViewController.h"

@class DevcampViewController;

@interface ResultsViewController : UIViewController {
    IBOutlet UIWebView *resultsView;
	
	DevcampViewController *dev;
	
	IBOutlet SuggestViewController *suggestViewController;
}

- (IBAction)goStartOver;
- (IBAction)goSuggest;

@property (retain,nonatomic) DevcampViewController *dev;
@end
