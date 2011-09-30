//
//  ContentManager.m
//  BiggerWallet
//
//  Created by Jos Kuijpers on 9/28/11.
//  Copyright 2011 Jos Kuijpers. All rights reserved.
//

#import "ContentManager.h"

@implementation ContentManager

@synthesize provider, purchaser, publisher;

- (id)init
{
    self = [super init];
    if (self)
    {
        // Create instances of all content elements
        purchaser = [[ContentPurchaser alloc] init];
        provider = [[ContentProvider alloc] init];
        publisher = [[ContentPublisher alloc] init];
    }
    
    return self;
}

- (void)dealloc {

    [provider release];
    [publisher release];
    [purchaser release];
    
    [super dealloc];
}

@end
