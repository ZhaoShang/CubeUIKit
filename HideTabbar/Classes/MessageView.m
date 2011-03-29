//
//  MessageView.m
//  HideTabbar
//
//  Created by Worker on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MessageView.h"

#import "FakeNavigationBar.h"
#import "MessageTableView.h"
#import "MessageBoxView.h"

#import "MyMessageCell.h"

@implementation MessageView
@synthesize dontLayout;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		dontLayout = NO;
		messageTableView = [[MessageTableView alloc] initWithFrame:CGRectZero];
		messageTableView.backgroundColor = [UIColor clearColor];
		[messageTableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
		[messageTableView setAutoresizesSubviews:YES];
		messageTableView.separatorColor = [UIColor clearColor];
		messageTableView.dataSource = self;
		messageTableView.delegate = self;
		[self addSubview:messageTableView];
		
		messageBoxView = [[MessageBoxView alloc] initWithFrame:CGRectZero];
		messageBoxView.messageView = self;
		messageBoxView.backgroundColor = [UIColor whiteColor];
		[messageBoxView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
		[messageBoxView setAutoresizesSubviews:YES];
		[self addSubview:messageBoxView];
    }
    return self;
}

#define MESSAGEBOX_HEIGHT 55.0f
#define KEYBOARD_HEIGHT 170.0f
#define KEYBOARD_LANDSCAPE_HEIGHT 160.0f
- (void)layoutSubviews
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
	float offsetY = 0;
	if (orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown)
	{
		offsetY = KEYBOARD_HEIGHT;
	}
	else
	{
		offsetY = KEYBOARD_LANDSCAPE_HEIGHT;
	}
	
	if (!dontLayout)
	{
		messageTableView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - MESSAGEBOX_HEIGHT);
		if (startInput || stopInput)
		{
			[UIView beginAnimations:nil context:NULL];
			[UIView setAnimationDuration:0.25];
		}
		messageBoxView.frame = CGRectMake(0, self.frame.size.height - MESSAGEBOX_HEIGHT, self.frame.size.width, MESSAGEBOX_HEIGHT);
		if (startInput || stopInput)
		{
			[UIView commitAnimations];
		}
	}
	else {
		messageTableView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - MESSAGEBOX_HEIGHT - offsetY);
		if (startInput || stopInput)
		{
			[UIView beginAnimations:nil context:NULL];
			[UIView setAnimationDuration:0.25];
		}
		messageBoxView.frame = CGRectMake(0, self.frame.size.height - MESSAGEBOX_HEIGHT - offsetY, self.frame.size.width, MESSAGEBOX_HEIGHT);
		if (startInput || stopInput)
		{
			[UIView commitAnimations];
		}
	}
}

- (void)dealloc {
	[messageBoxView release];
	[messageTableView release];
    [super dealloc];
}

- (void)startInputMessage
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	dontLayout = YES;
	startInput = YES;
	stopInput = NO;
	[self layoutSubviews];
}

- (void)stopInputMessage
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	dontLayout = NO;
	startInput = NO;
	stopInput = YES;
	[self layoutSubviews];
}

#pragma mark -
#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *message = @"This is.";
	
	return [MyMessageCell rowHeightForMessage:message inFrame:self.frame].height + 40;
}

#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellIdentifier = @"Cell";
//	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	MyMessageCell *cell = (MyMessageCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (!cell)
	{
		cell = [[[MyMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
	}
//	cell.textLabel.text = [NSString stringWithFormat:@"Cell%d", indexPath.row + 1];
	cell.backgroundColor = [UIColor clearColor];
	return cell;
}

@end
