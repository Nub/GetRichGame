//
//  Stock.m
//  
//
//  Created by Zachry Thayer on 9/23/11.
//  Copyright 2011 Penguins With Mustaches. All rights reserved.
//

#import "Stock.h"
#import "StockPurchase.h"
#import "JSONKit.h"

@implementation Stock

@synthesize name = name;
@synthesize purchases = purchases;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}


- (void)dealloc {
    [name release], name = nil;
    [purchases release], purchases = nil;

    [super dealloc];

}


+ (Stock *)instanceFromDictionary:(NSDictionary *)aDictionary {

    Stock *instance = [[[Stock alloc] init] autorelease];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    self.name = [aDictionary objectForKey:@"Name"];

    NSArray *receivedPurchases = [aDictionary objectForKey:@"Purchases"];
    if ([receivedPurchases isKindOfClass:[NSArray class]]) {

        NSMutableArray *parsedPurchases = [NSMutableArray arrayWithCapacity:[receivedPurchases count]];
        for (NSDictionary *item in receivedPurchases) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedPurchases addObject:[StockPurchase instanceFromDictionary:item]];
            }
        }

        self.purchases = parsedPurchases;

    }


}

// NOTE: Might want to use getters and setters here instead of direct
// ivar access. But if no overrides of those setters/getters happen
// it is only a waste of cycles
- (NSDictionary *)serializeToDictionary {
    
    NSMutableDictionary *ret = [[NSMutableDictionary alloc] init];
    
    if(name)
        [ret setObject:name forKey:@"Name"];
    
    if(purchases)
    {
        NSMutableArray *serializedPurchases = [[NSMutableArray alloc] init];
        
        for(StockPurchase *purchase in purchases)
        {
            if([purchase isKindOfClass:[StockPurchase class]])
                [serializedPurchases addObject:[purchase serializeToDictionary]];
        }
        
        [ret setObject:serializedPurchases forKey:@"Purchases"];
        [serializedPurchases release];
    }
    
    [ret autorelease];
    return [[ret copy] autorelease];
}

- (NSString *)serializeToJSONString{
    return [[self serializeToDictionary] JSONString];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ {Name %@, Purchases %@}",
            [super description],name,purchases];
}

@end
