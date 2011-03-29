//
//  HideTabbarAppDelegate.h
//  HideTabbar
//
//  Created by Worker on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TabbarViewController;
@class RootViewController;

@interface HideTabbarAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	TabbarViewController	*tabController;
	RootViewController		*rootController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, readonly) TabbarViewController *tabController;

- (void)setRootFrame;

@end

