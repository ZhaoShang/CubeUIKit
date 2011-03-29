//
//  MyMessageCell.m
//  HideTabbar
//
//  Created by Worker on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyMessageCell.h"


@implementation MyMessageCell
@synthesize messageLabel;
@synthesize cellAlignment;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
		cellAlignment = MessageCellAlignmentRight;
		backgroundView = [[UIImageView alloc] initWithFrame:CGRectZero];
		[self addSubview:backgroundView];
		
		messageFont = [UIFont systemFontOfSize:14];
		messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		[messageLabel setTextColor:[UIColor blackColor]];
		[messageLabel setBackgroundColor:[UIColor clearColor]];
		[messageLabel setFont:messageFont];
		[messageLabel setTextAlignment:UITextAlignmentLeft];
		[messageLabel setLineBreakMode:UILineBreakModeWordWrap];
		[messageLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
		[messageLabel setAutoresizesSubviews:YES];
		[self addSubview:messageLabel];
		
		timeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		[timeLabel setTextColor:[UIColor grayColor]];
		[timeLabel setBackgroundColor:[UIColor clearColor]];
		[timeLabel setFont:[UIFont systemFontOfSize:12]];
		[timeLabel setTextAlignment:UITextAlignmentLeft];
		[timeLabel setLineBreakMode:UILineBreakModeWordWrap];
		[timeLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
		[timeLabel setAutoresizesSubviews:YES];
		[self addSubview:timeLabel];
    }
    return self;
}

+ (CGSize)rowHeightForMessage:(NSString *)message inFrame:(CGRect)frame
{
	CGFloat stringWidthInRow = frame.size.width - 90;
	
	CGSize maximumLabelSize = CGSizeMake(stringWidthInRow, 9999);
	
	CGSize messageSize = [message sizeWithFont:[UIFont systemFontOfSize:14]
							 constrainedToSize:maximumLabelSize 
								 lineBreakMode:UILineBreakModeWordWrap];
	
	return messageSize;
}

- (int)rowForMessage:(NSString *)message
{
	CGFloat stringWidthInRow = self.frame.size.width - 90;
	
	CGSize maximumLabelSize = CGSizeMake(stringWidthInRow, 9999);
	
	CGSize messageSize = [message sizeWithFont:messageFont
							 constrainedToSize:maximumLabelSize 
								 lineBreakMode:UILineBreakModeWordWrap];
	int row = 1;
	if (messageSize.height > 18)
	{
		row = (int)messageSize.height / 18;
		if ((int)messageSize.height % 18 > 0)
			row++;
	}
	return row;
}

- (void)layoutSubviews
{
	NSString *message = @"This is.";
	int row = [self rowForMessage:message];
	
	CGFloat stringWidthInRow = self.frame.size.width - 90;
	
	messageLabel.numberOfLines = row;
	messageLabel.text = message;

	timeLabel.text = @"2011-12-25 13:30";

	CGSize actualMessageSize = [MyMessageCell rowHeightForMessage:message inFrame:self.frame];
	float x = self.frame.size.width - 40;
	float labelWidth = stringWidthInRow;
	if (actualMessageSize.width < x)
	{
		x = actualMessageSize.width + 50;
		if (x < 150)
			x = 150;
		labelWidth = x - 50;
		if (labelWidth < 100)
			labelWidth = 100;
	}
	if (cellAlignment == MessageCellAlignmentLeft)
	{
		messageLabel.frame = CGRectMake(22, 10, labelWidth, actualMessageSize.height);
		timeLabel.frame = CGRectMake(22, actualMessageSize.height+15, stringWidthInRow, 14);
		backgroundView.frame = CGRectMake(0, 5, x, actualMessageSize.height + 35);
		UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bg_chat_y.png" ofType:nil]];
		image = [image stretchableImageWithLeftCapWidth:40 topCapHeight:22];
		backgroundView.image = image;
	}
	else {
		messageLabel.frame = CGRectMake(self.frame.size.width - x + 20, 10, labelWidth, actualMessageSize.height);
		timeLabel.frame = CGRectMake(self.frame.size.width - x + 20, actualMessageSize.height+15, stringWidthInRow, 14);
		backgroundView.frame = CGRectMake(self.frame.size.width - x, 5, x, actualMessageSize.height + 35);
		UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bg_chat_g.png" ofType:nil]];
		image = [image stretchableImageWithLeftCapWidth:40 topCapHeight:22];
		backgroundView.image = image;
	}
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}

- (void)dealloc {
	[messageLabel release];
	[backgroundView release];
    [super dealloc];
}


@end
