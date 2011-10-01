//
//  ContentManager.m
//  BiggerWallet
//
//  Created by Jos Kuijpers on 9/28/11.
//  Copyright 2011 Jos Kuijpers. All rights reserved.
//

#import "ContentManager.h"
#import <libkern/OSAtomic.h>

#import "ContentProvider.h"
#import "ContentPublisher.h"
#import "ContentPurchaser.h"
#import "BWNetworking.h"

static void *volatile _contentManagerInstance = nil;

@implementation ContentManager

@synthesize provider, purchaser, publisher, networking;

- (id)init
{
    self = [super init];
    if (self)
    {
        // Create instances of all content elements
        purchaser = [[ContentPurchaser alloc] init];
        provider = [[ContentProvider alloc] init];
        publisher = [[ContentPublisher alloc] init];
        networking = [[BWNetworking alloc] init];
    }
    
    return self;
}

- (void)dealloc {
    [provider release];
    [publisher release];
    [purchaser release];
    [networking release];
    
    [super dealloc];
}

+ (ContentManager *)singleton
{
    while(!_contentManagerInstance)
    {
        ContentManager *tmp = [[self alloc] init];
        if(!OSAtomicCompareAndSwapPtrBarrier(0x0, tmp, &_contentManagerInstance))
            [tmp release];
    }
    return _contentManagerInstance;
}


@end
