//
//  ContentManager.h
//  BiggerWallet
//
//  Created by Jos Kuijpers on 9/28/11.
//  Copyright 2011 Jos Kuijpers. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ContentProvider;
@class ContentPublisher;
@class ContentPurchaser;
@class BWNetworking;

@interface ContentManager : NSObject
{
    ContentProvider *provider;
    ContentPublisher *publisher;
    ContentPurchaser *purchaser;
    BWNetworking *networking;
}

@property (readonly) ContentProvider *provider;
@property (readonly) ContentPublisher *publisher;
@property (readonly) ContentPurchaser *purchaser;
@property (readonly) BWNetworking *networking;

+ (ContentManager *)singleton;

@end
