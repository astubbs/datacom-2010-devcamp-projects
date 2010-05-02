//
//  SuggestViewController.h
//
//  Created by Karl von Randow on 2/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class DevcampViewController;

@interface SuggestViewController : UIViewController {
	IBOutlet UITextField *textField;
	DevcampViewController *dev;
}
- (IBAction) doAdd;
- (IBAction) doCancel;

@property (retain,nonatomic) DevcampViewController *dev;
@end
