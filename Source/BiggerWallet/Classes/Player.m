//
//  Player.m
//  
//
//  Created by Zachry Thayer on 9/23/11.
//  Copyright 2011 Penguins With Mustaches. All rights reserved.
//

#import "Player.h"

#import "Stock.h"

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

@end
