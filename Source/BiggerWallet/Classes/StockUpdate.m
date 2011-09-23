//
//  StockUpdate.m
//  
//
//  Created by Zachry Thayer on 9/23/11.
//  Copyright 2011 Penguins With Mustaches. All rights reserved.
//

#import "StockUpdate.h"

@implementation StockUpdate

@synthesize date = date;
@synthesize value = value;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}


- (void)dealloc {
    [date release], date = nil;
    [value release], value = nil;

    [super dealloc];

}


+ (StockUpdate *)instanceFromDictionary:(NSDictionary *)aDictionary {

    StockUpdate *instance = [[[StockUpdate alloc] init] autorelease];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    self.date = [aDictionary objectForKey:@"date"];
    self.value = [aDictionary objectForKey:@"value"];

}

@end
