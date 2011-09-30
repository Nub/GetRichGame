//
//  StockPurchase.m
//  
//
//  Created by Zachry Thayer on 9/23/11.
//  Copyright 2011 Zachry Thayer. All rights reserved.
//  Copyright 2011 Jos Kuijpers. All rights reserved.
//

#import "StockPurchase.h"
#import "JSONKit.h"

@implementation StockPurchase

@synthesize shares = shares;
@synthesize price = price;
@synthesize date = date;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}


- (void)dealloc {
    [shares release], shares = nil;
    [price release], price = nil;
    [date release], date = nil;

    [super dealloc];

}

#pragma mark - Parsing


+ (StockPurchase *)instanceFromDictionary:(NSDictionary *)aDictionary {

    StockPurchase *instance = [[[StockPurchase alloc] init] autorelease];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    self.shares = [aDictionary objectForKey:kStockUpdateSharesKey];
    self.price = [aDictionary objectForKey:kStockUpdatePriceKey];
    self.date   = [aDictionary objectForKey:kStockUpdatsDateKey];

}

+ (StockPurchase *)instanceFromJSONString:(NSString *)string {
    return [self instanceFromDictionary:[string objectFromJSONString]];
}

#pragma mark - Serializing

// NOTE: Might want to use getters and setters here instead of direct
// ivar access. But if no overrides of those setters/getters happen
// it is only a waste of cycles
- (NSDictionary *)serializeToDictionary {
    
    NSMutableDictionary *ret = [[NSMutableDictionary alloc] init];
    
    if(shares)
        [ret setObject:shares forKey:kStockUpdateSharesKey];
    if(price)
        [ret setObject:price forKey:kStockUpdatePriceKey];
    if(date)
        [ret setObject:date forKey:kStockUpdatsDateKey];
    
    [ret autorelease];
    return [[ret copy] autorelease];
}

- (NSString *)serializeToJSONString{
    return [[self serializeToDictionary] JSONString];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ {Shares: %@, Price: %@, Date: %@}",
            [super description],shares, price, date];
}

@end
