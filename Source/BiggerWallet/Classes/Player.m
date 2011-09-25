//
//  Player.m
//  
//
//  Created by Zachry Thayer on 9/23/11.
//  Copyright 2011 Penguins With Mustaches. All rights reserved.
//  Copyright 2011 Jos Kuijpers. All rights reserved.
//

#import "Player.h"
#import "Stock.h"
#import "JSONKit.h"

@implementation Player

@synthesize cash = cash;
@synthesize name = name;
@synthesize rank = rank;
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
    [rank release], rank = nil;
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

    self.cash = [aDictionary objectForKey:@"Cash"];
    self.name = [aDictionary objectForKey:@"Name"];
    self.rank = [aDictionary objectForKey:@"Rank"];

    NSArray *receivedStocks = [aDictionary objectForKey:@"Stocks"];
    if ([receivedStocks isKindOfClass:[NSArray class]]) {

        NSMutableArray *parsedStocks = [NSMutableArray arrayWithCapacity:[receivedStocks count]];
        for (NSDictionary *item in receivedStocks) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedStocks addObject:[Stock instanceFromDictionary:item]];
            }
        }

        self.stocks = parsedStocks;

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
        [ret setObject:cash forKey:@"Cash"];
    if(name)
        [ret setObject:name forKey:@"Name"];
    if(rank)
        [ret setObject:rank forKey:@"Rank"];

    if(stocks)
    {
        NSMutableArray *serializedStocks = [[NSMutableArray alloc] init];
        
        for(Stock *stock in stocks)
        {
            if([stock isKindOfClass:[Stock class]])
                [serializedStocks addObject:[stock serializeToDictionary]];
        }
        
        [ret setObject:serializedStocks forKey:@"Stocks"];
        [serializedStocks release];
    }
    
    [ret autorelease];
    return [[ret copy] autorelease];
}

- (NSString *)serializeToJSONString{
    return [[self serializeToDictionary] JSONString];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ {Cash %@, Name %@, Rank %@, Stocks %@}",
            [super description],cash,name,rank,stocks];
}

#pragma mark - Content Provider

- (NSNumber *)netWorth {
    return nil;
}

- (NSNumber *)netWorthOfStocks {
    return nil;
}

- (Stock *)_stockObjectForName:(NSString *)stock
{
    if(stock == nil || stocks == nil)
        return nil;
    
    for(Stock *st in stocks)
    {
        if([st isKindOfClass:[Stock class]])
        {
            if([st.name isEqualToString:stock])
                return [[st retain] autorelease];
        }
    }
    
    return nil;
}

- (NSNumber *)netWorthOfStock:(NSString *)stock {
    
    Stock *theStock = [self _stockObjectForName:stock];
    if(theStock == nil)
        return nil;
    
    
    return nil;
}

- (NSNumber *)netPurchasePriceOfStock:(NSString *)stock {
    
    Stock *theStock = [self _stockObjectForName:stock];
    if(theStock == nil)
        return nil;
    
    
    return nil;
}

- (NSNumber *)numberOfShareInStock:(NSString *)stock {
    
    Stock *theStock = [self _stockObjectForName:stock];
    if(theStock == nil)
        return nil;
    
    return nil;
}

#pragma mark - Content Publisher

- (BOOL)purchaseSharesInStock:(NSString *)stock amount:(NSNumber *)amount {
    return NO;
}

- (BOOL)sellSharesInStock:(NSString *)stock amount:(NSNumber *)amount {
    return NO;
}

- (BOOL)purchaseMoneyAmount:(NSNumber *)amount {
    return NO;
}

- (void)synchronize {
    return;
}

@end
