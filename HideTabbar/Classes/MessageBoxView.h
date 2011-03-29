//
//  MessageBoxView.h
//  HideTabbar
//
//  Created by Worker on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MessageView;

@interface MessageBoxView : UIView<UITextFieldDelegate> {
	UITextField	*inputTextField;
	UILabel		*statusLabel;
	UIButton	*sendButton;
	
	MessageView *messageView;
}

@property (nonatomic, readonly) UITextField *inputTextField;
@property (nonatomic, readonly) UILabel *statusLabel;
@property (nonatomic, assign) MessageView *messageView;

@end
