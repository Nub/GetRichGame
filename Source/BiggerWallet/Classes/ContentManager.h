//
//  ContentManager.h
//  BiggerWallet
//
//  Created by Jos Kuijpers on 9/28/11.
//  Copyright 2011 Jos Kuijpers. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ContentProvider.h"
#import "ContentPublisher.h"
#import "ContentPurchaser.h"

@interface ContentManager : NSObject
{
    ContentProvider *provider;
    ContentPublisher *publisher;
    ContentPurchaser *purchaser;
}

@property (readonly) ContentProvider *provider;
@property (readonly) ContentPublisher *publisher;
@property (readonly) ContentPurchaser *purchaser;

// This must be a singleton
// -(ContentManager *)singleton;

@end
