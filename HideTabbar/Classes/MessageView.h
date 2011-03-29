//
//  MessageView.h
//  HideTabbar
//
//  Created by Worker on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MessageTableView;
@class MessageBoxView;

@interface MessageView : UIView<UITableViewDelegate, UITableViewDataSource> {
	MessageTableView	*messageTableView;
	MessageBoxView		*messageBoxView;
	
	BOOL	dontLayout;
	BOOL	startInput;
	BOOL	stopInput;
}

@property (nonatomic, assign) BOOL dontLayout;

- (void)startInputMessage;
- (void)stopInputMessage;

@end
