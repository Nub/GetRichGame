//
//  Player.m
//  
//
//  Created by Zachry Thayer on 9/23/11.
//  Copyright 2011 Zachry Thayer. All rights reserved.
//  Copyright 2011 Jos Kuijpers. All rights reserved.
//

#import "Player.h"
#import "StockPurchase.h"
#import "JSONKit.h"

@implementation Player

@synthesize cash = cash;
@synthesize name = name;
@synthesize stocks = stocks;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}


- (void)dealloc {
    [cash release], cash = nil;
    [name release], name = nil;
    [stocks release], stocks = nil;

    [super dealloc];

}

#pragma mark - Parsing

+ (Player *)instanceFromDictionary:(NSDictionary *)aDictionary {

    Player *instance = [[[Player alloc] init] autorelease];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    self.cash = [aDictionary objectForKey:kPlayerCashKey];
    self.name = [aDictionary objectForKey:kPlayerNameKey];

    self.stocks = [[NSMutableDictionary alloc] init];

    
    NSDictionary *receivedStocks = [aDictionary objectForKey:kPlayerStocksKey];
    if ([receivedStocks isKindOfClass:[NSDictionary class]]) {
        
        for (NSString *key in receivedStocks) {
            
            NSDictionary *item = [receivedStocks objectForKey:key];
            
            if ([item isKindOfClass:[NSDictionary class]]) {//if its a single purchase or old data set update to array
                
                NSArray *stockPurchases = [NSArray arrayWithObject:[StockPurchase instanceFromDictionary:item]]; // Multiple Purchases per stock name
                
                [self.stocks setObject:stockPurchases forKey:key];
                
                [stockPurchases release];
                
            }else if([item isKindOfClass:[NSArray class]]){// Array of purchases
                
                NSMutableArray *stockPurchases = [NSMutableArray array];
                
                for (NSDictionary *purchase in item) {
                    
                    [stockPurchases addObject:[StockPurchase instanceFromDictionary:purchase]];
                    
                }
                
                [self.stocks setObject:stockPurchases forKey:key];
                
                [stockPurchases release];
                
            }
            
            
        }

    }


}

+ (Player *)instanceFromJSONString:(NSString *)string {
    return [self instanceFromDictionary:[string objectFromJSONString]];
}

#pragma mark - Serializing

// NOTE: Might want to use getters and setters here instead of direct
// ivar access. But if no overrides of those setters/getters happen
// it is only a waste of cycles
- (NSDictionary *)serializeToDictionary {
    
    NSMutableDictionary *ret = [[NSMutableDictionary alloc] init];
    
    if(cash)
        [ret setObject:cash forKey:kPlayerCashKey];
    if(name)
        [ret setObject:name forKey:kPlayerNameKey];

    if(stocks)
    {
        NSMutableDictionary *serialStocks = [NSMutableDictionary dictionary];
        
        for (NSString *key in stocks) {
         
            NSMutableArray *serialPurchases = [NSMutableArray array];
            
            NSArray *item = [stocks objectForKey:key];
            if ([item isKindOfClass:[NSArray class]]) {
                
                for (StockPurchase *purchase in item) {
                    
                    NSDictionary *serialPurchase = [purchase serializeToDictionary];
                    [serialPurchases addObject:serialPurchase];
                    
                }//purchase in item
                
                
            }//if array
            
            [serialStocks setObject:serialPurchases forKey:key];
            
        }//ket in stocks
        
        [ret setObject:serialStocks forKey:kPlayerStocksKey];
    }
    
    [ret autorelease];
    return [[ret copy] autorelease];
}

- (NSString *)serializeToJSONString{
    return [[self serializeToDictionary] JSONString];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ {Cash %@, Name %@, Stocks %@}",
            [super description],cash,name,stocks];
}

@end
