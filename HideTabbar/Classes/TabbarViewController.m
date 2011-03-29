    //
//  TabbarViewController.m
//  HideTabbar
//
//  Created by Worker on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TabbarViewController.h"


@implementation TabbarViewController
@synthesize enableLandscape;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	enableLandscape = NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return enableLandscape;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
