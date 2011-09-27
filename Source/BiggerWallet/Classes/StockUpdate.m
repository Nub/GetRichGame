//
//  StockUpdate.m
//  
//
//  Created by Zachry Thayer on 9/23/11.
//  Copyright 2011 Zachry Thayer. All rights reserved.
//  Copyright 2011 Jos Kuijpers. All rights reserved.
//

#import "StockUpdate.h"
#import "JSONKit.h"

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

#pragma mark - Parsing


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

+ (StockUpdate *)instanceFromJSONString:(NSString *)string {
    return [self instanceFromDictionary:[string objectFromJSONString]];
}

#pragma mark - Serializing

// NOTE: Might want to use getters and setters here instead of direct
// ivar access. But if no overrides of those setters/getters happen
// it is only a waste of cycles
- (NSDictionary *)serializeToDictionary {
    
    NSMutableDictionary *ret = [[NSMutableDictionary alloc] init];
    
    if(date)
        [ret setObject:date forKey:@"date"];
    if(value)
        [ret setObject:value forKey:@"value"];
    
    [ret autorelease];
    return [[ret copy] autorelease];
}

- (NSString *)serializeToJSONString{
    return [[self serializeToDictionary] JSONString];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ {date %@, value %@}",
            [super description],date,value];
}

@end
