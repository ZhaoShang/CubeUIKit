//
//  MessageBoxView.m
//  HideTabbar
//
//  Created by Worker on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MessageBoxView.h"
#import "MessageView.h"

@implementation MessageBoxView
@synthesize inputTextField;
@synthesize statusLabel;
@synthesize messageView;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		statusLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		[statusLabel setTextColor:[UIColor blackColor]];
		[statusLabel setBackgroundColor:[UIColor clearColor]];
		[statusLabel setFont:[UIFont systemFontOfSize:12]];
		[statusLabel setTextAlignment:UITextAlignmentLeft];
		[statusLabel setText:@"TA is entering..."];
		[statusLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
		[statusLabel setAutoresizesSubviews:YES];
		[self addSubview:statusLabel];
		
		inputTextField = [[UITextField alloc] initWithFrame:CGRectZero];
		[inputTextField setBorderStyle:UITextBorderStyleRoundedRect];
		[inputTextField setPlaceholder:@"Enter message here"];
		[inputTextField setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
		[inputTextField setAutoresizesSubviews:YES];
		inputTextField.delegate = self;
		[self addSubview:inputTextField];
		
		sendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[sendButton setTitle:@"Send" forState:UIControlStateNormal];
		[sendButton setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
		[sendButton setAutoresizesSubviews:YES];
		[self addSubview:sendButton];
    }
    return self;
}

- (void)layoutSubviews
{
	statusLabel.frame = CGRectMake(8, 3, self.frame.size.width - 10, 16);
	inputTextField.frame = CGRectMake(5, 20, self.frame.size.width - 10 - 70, 30);
	sendButton.frame = CGRectMake(self.frame.size.width - 70, 20, 65, 32);
}

- (void)dealloc {
	messageView = nil;
	[statusLabel release];
	[inputTextField release];
    [super dealloc];
}

#pragma mark -
#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	if (messageView)
	{
		[messageView stopInputMessage];
	}
	return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	if (messageView)
	{
		[messageView startInputMessage];
	}
}

@end
