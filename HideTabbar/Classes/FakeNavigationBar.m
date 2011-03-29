//
//  FakeNavigationBar.m
//  HideTabbar
//
//  Created by Worker on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FakeNavigationBar.h"


@implementation FakeNavigationBar
@synthesize titleLabel;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		[titleLabel setTextColor:[UIColor whiteColor]];
		[titleLabel setBackgroundColor:[UIColor clearColor]];
		[titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
		[titleLabel setTextAlignment:UITextAlignmentCenter];
		[self addSubview:titleLabel];
    }
    return self;
}

- (void)layoutSubviews
{
	titleLabel.frame = CGRectMake(60, 5, self.frame.size.width - 120, 34);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
	[titleLabel release];
    [super dealloc];
}


@end
