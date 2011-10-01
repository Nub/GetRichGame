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

// Player
- (NSNumber *)playerCash;
- (NSString *)playerName;
- (NSNumber *)playerNetWorth;
- (NSArray *)playerStockList;
- (NSNumber *)playerStocksNetWorth;
- (NSNumber *)netPurchasePriceOfStockNamed:(NSString *)stock;
- (NSNumber *)numberOfSharesInStockNamed:(NSString *)stock;

// Stocks
- (void)searchForStocksNamed:(NSString *)name 
                  completion:(void(^)(NSArray *data))block;
- (void)getStockNamed:(NSString *)name 
           completion:(void(^)(NSDictionary *data))block;
- (void)splitsOfStockNamed:(NSString *)name 
         didSplitSinceDate:(NSDate *)date 
                completion:(void(^)(NSNumber *times))block;

@end
