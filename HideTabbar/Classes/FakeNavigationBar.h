//
//  FakeNavigationBar.h
//  HideTabbar
//
//  Created by Worker on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FakeNavigationBar : UIView {
	UILabel	*titleLabel;
}

@property (nonatomic, readonly) UILabel *titleLabel;

@end
