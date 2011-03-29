//
//  MyMessageCell.h
//  HideTabbar
//
//  Created by Worker on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
	MessageCellAlignmentLeft = 0,
	MessageCellAlignmentRight = 1,
} MessageCellAlignment;

@interface MyMessageCell : UITableViewCell {
	UIImageView		*backgroundView;
	UILabel		*messageLabel;
	UILabel		*timeLabel;
	UIFont		*messageFont;
	
	MessageCellAlignment cellAlignment;
}

@property (nonatomic, readonly) UILabel *messageLabel;
@property (nonatomic, assign) MessageCellAlignment cellAlignment;

+ (CGSize)rowHeightForMessage:(NSString *)message inFrame:(CGRect)frame;

@end
