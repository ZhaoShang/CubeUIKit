    //
//  RootViewController.m
//  HideTabbar
//
//  Created by Worker on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "HideTabbarAppDelegate.h"
#import "TabbarViewController.h"

#import "MessageView.h"
#import "FakeNavigationBar.h"

@implementation RootViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bg_stripe.png" ofType:nil]]];
	
	messageView = [[MessageView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 44)];
	[messageView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
	[messageView setAutoresizesSubviews:YES];
	[self.view addSubview:messageView];
	
	fakeNavBar = [[FakeNavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
	fakeNavBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fakebar.png" ofType:nil]]];
	[fakeNavBar setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
	[fakeNavBar setAutoresizesSubviews:YES];
	[self.view addSubview:fakeNavBar];
	fakeNavBar.titleLabel.text = @"Message";
	
	self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	HideTabbarAppDelegate *appDelegate = (HideTabbarAppDelegate *)[[UIApplication sharedApplication] delegate];
	appDelegate.tabController.enableLandscape = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
	HideTabbarAppDelegate *appDelegate = (HideTabbarAppDelegate *)[[UIApplication sharedApplication] delegate];
	appDelegate.tabController.enableLandscape = NO;
}

- (void)hideTabbar
{
	UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
	float offsetY = 0;
	if (orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown)
	{
		offsetY = 480;
	}
	else
	{
		offsetY = 320;
	}
	
	[UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    for(UIView *view in self.tabBarController.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(view.frame.origin.x, offsetY, view.frame.size.width, view.frame.size.height)];
        } 
        else 
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, offsetY)];
        }
    }
	
    [UIView commitAnimations];
}

- (void)showTabbar
{
	UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
	float offsetY = 0;
	if (orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown)
	{
		offsetY = 431;
	}
	else
	{
		offsetY = 271;
	}
	
	[UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    for(UIView *view in self.tabBarController.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(view.frame.origin.x, offsetY, view.frame.size.width, view.frame.size.height)];		
        } 
        else 
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, offsetY)];
        }
    }
	
    [UIView commitAnimations];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return YES;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	if (fromInterfaceOrientation == UIInterfaceOrientationPortrait || fromInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
	{
		[self hideTabbar];
	}
	else {
		[self showTabbar];
	}
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
