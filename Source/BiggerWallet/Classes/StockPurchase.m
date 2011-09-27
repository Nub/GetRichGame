//
//  StockPurchase.m
//  
//
//  Created by Zachry Thayer on 9/23/11.
//  Copyright 2011 Zachry Thayer. All rights reserved.
//  Copyright 2011 Jos Kuijpers. All rights reserved.
//

#import "StockPurchase.h"
#import "StockUpdate.h"
#import "JSONKit.h"

@implementation StockPurchase

@synthesize shares = shares;
@synthesize stockUpdate = stockUpdate;

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
    [stockUpdate release], stockUpdate = nil;

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

    self.shares = [aDictionary objectForKey:@"Shares"];
    self.stockUpdate = [StockUpdate instanceFromDictionary:[aDictionary objectForKey:@"StockUpdate"]];

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
        [ret setObject:shares forKey:@"Shares"];
    if(stockUpdate)
        [ret setObject:[stockUpdate serializeToDictionary] forKey:@"StockUpdate"];
    
    [ret autorelease];
    return [[ret copy] autorelease];
}

- (NSString *)serializeToJSONString{
    return [[self serializeToDictionary] JSONString];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ {Shares %@, StockUpdate %@}",
            [super description],shares,stockUpdate];
}

@end
