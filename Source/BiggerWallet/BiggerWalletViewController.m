//
//  BiggerWalletViewController.m
//  BiggerWallet
//
//  Created by Zachry Thayer on 9/23/11.
//  Copyright 2011 Zachry Thayer. All rights reserved.
//

#import "BiggerWalletViewController.h"

@implementation BiggerWalletViewController
@synthesize pagedView;
@synthesize testVCs;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
        
    [pagedView setDelegate:self];
    [pagedView setDataSource:self];
    
}


- (void)viewDidUnload
{
    [self setTestVCs:nil];
    [self setPagedView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [testVCs release];
    [pagedView release];
    [super dealloc];
}

#pragma mark - PagedView Delegate


#pragma mark - PagedView DataSource

- (NSInteger)numberOfPagesInPagedView:(ZTInfinitePagedV *)pagedView{
        
    return [testVCs count];
    
}

- (UIView*)pagedView:(ZTInfinitePagedV *)pagedView viewForPage:(NSInteger)page
{
    
    return [[testVCs objectAtIndex:page] view];
    
}


@end
