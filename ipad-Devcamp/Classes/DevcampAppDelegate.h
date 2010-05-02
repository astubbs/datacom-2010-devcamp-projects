//
//  DevcampAppDelegate.h
//  Devcamp
//
//  Created by Karl von Randow on 1/05/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DevcampViewController;

@interface DevcampAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DevcampViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DevcampViewController *viewController;

@end

