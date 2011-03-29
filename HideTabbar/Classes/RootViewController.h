//
//  RootViewController.h
//  HideTabbar
//
//  Created by Worker on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MessageView;
@class FakeNavigationBar;

@interface RootViewController : UIViewController {
	FakeNavigationBar	
					*fakeNavBar;
	MessageView		*messageView;
}

@end
