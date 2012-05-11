//
//  ContentProvider.m
//  BiggerWallet
//
//  Created by Zachry Thayer on 9/25/11.
//  Copyright 2011 Zachry Thayer. All rights reserved.
//

#import "ContentProvider.h"
#import "JSONKit.h"

#import "StockPurchase.h"
#import "ContentManager.h"
#import "BWNetworking.h"

@implementation ContentProvider

@synthesize player;

- (id)init
{
    self = [super init];
    if (self) {
        // Check for player cache file
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *cacheDirectory = [paths objectAtIndex:0];
        
        NSString *playerCacheFilePath = [cacheDirectory stringByAppendingPathComponent:kContentProviderPlayerCacheFile];
        
        player = [[Player alloc] init];
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:playerCacheFilePath]) {// Cache Exists
            NSString *jsonString = [NSString stringWithContentsOfFile:playerCacheFilePath encoding:NSUTF8StringEncoding error:nil];
            
            [self.player setAttributesFromDictionary:[jsonString objectFromJSONString]];
            
        } else {// No Cache exists
            
            NSString *testPlayer = [[NSBundle mainBundle] pathForResource:@"testPlayer" ofType:@"json"];
            
            NSString *jsonString = [NSString stringWithContentsOfFile:testPlayer encoding:NSUTF8StringEncoding error:nil];
            
            [self.player setAttributesFromDictionary:[jsonString objectFromJSONString]];
        }
        
    }
    
    return self;
}

- (void)dealloc{
    
    [player release];
    
    [super dealloc];
    
}

#pragma mark - Player Provider

- (NSNumber *)playerCash
{
    return player.cash;
}

- (NSString *)playerName
{
    return player.name;
}

- (NSNumber *)playerNetWorth
{
    // FIXME: TODO
    float added = 0.0;
    return [NSNumber numberWithFloat:added];
}

- (NSArray *)playerStockList
{
    // Create an array of stocks the player has (symbols only)
    return [player.stocks allKeys];
}

- (NSNumber *)playerStocksNetWorth
{
    return nil;
}

- (NSNumber *)netPurchasePriceOfStockNamed:(NSString *)stock
{
    return nil;
}

- (NSNumber *)numberOfSharesInStockNamed:(NSString *)stock
{
    if(stock == nil)
        return nil;
    
    NSArray *st = [player.stocks objectForKey:stock];
    if(st == nil)
        return nil;
    
    int val = 0;
    for(StockPurchase *d in st)
    {
        if(![d isKindOfClass:[StockPurchase class]])
            continue;
        val += [d.shares intValue];
    }
    
    return [NSNumber numberWithInt:val];
}

#pragma mark - Stock Provider

- (void)searchForStocksNamed:(NSString *)name 
                  completion:(void(^)(NSArray *data))block
{    
    BWNetworking *net = [[ContentManager singleton] networking];
    
    void (^myBlock)(NSArray *data) = [block copy];
    
    [net getFromCollection:@"stock"
                parameters:[NSArray arrayWithObjects:@"find",name,nil]
                completion:^(NSString *collection, NSArray *param, id ret) {
                    if(myBlock)
                        myBlock(ret);
                    [myBlock release];
                }];
    
}

- (void)getStockNamed:(NSString *)name 
           completion:(void(^)(NSDictionary *data))block
{
    BWNetworking *net = [[ContentManager singleton] networking];
    
    void (^myBlock)(NSArray *data) = [block copy];
    
    [net getFromCollection:@"stock"
                parameters:[NSArray arrayWithObject:name]
                completion:^(NSString *collection, NSArray *param, id ret) {
                    if(myBlock)
                        myBlock(ret);
                    [myBlock release];
                }];
}

- (void)splitsOfStockNamed:(NSString *)name 
         didSplitSinceDate:(NSDate *)date 
                completion:(void(^)(NSNumber *times))block
{
    if(block)
        block([NSNumber numberWithInt:0]);
}

@end
