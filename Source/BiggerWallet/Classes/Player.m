//
//  Player.m
//  
//
//  Created by Zachry Thayer on 9/23/11.
//  Copyright 2011 Penguins With Mustaches. All rights reserved.
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

@end
