//
//  ContentProvider.h
//  BiggerWallet
//
//  Created by Zachry Thayer on 9/25/11.
//  Copyright 2011 Zachry Thayer. All rights reserved.
//  Copyright 2011 Jos Kuijpers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

#define kContentProviderPlayerCacheFile @"playerCache.json"

@interface ContentProvider : NSObject{
    
    Player *player;
    
}

@property (nonatomic, retain) Player *player;

- (void)searchForStocksNamed:(NSString *)name 
                  completion:(void(^)(NSArray *data))block;


@end
