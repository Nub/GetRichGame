//
//  StockPurchase.m
//  
//
//  Created by Zachry Thayer on 9/23/11.
//  Copyright 2011 Penguins With Mustaches. All rights reserved.
//

#import "StockPurchase.h"

#import "StockUpdate.h"

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

@end
