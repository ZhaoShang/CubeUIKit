//
//  TabbarViewController.h
//  HideTabbar
//
//  Created by Worker on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TabbarViewController : UITabBarController {
	BOOL	enableLandscape;
}

@property (assign, getter=isEnableLandscape) BOOL enableLandscape;

@end
