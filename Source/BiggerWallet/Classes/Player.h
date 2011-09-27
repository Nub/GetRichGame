//
//  Player.h
//  
//
//  Created by Zachry Thayer on 9/23/11.
//  Copyright 2011 Zachry Thayer. All rights reserved.
//  Copyright 2011 Jos Kuijpers. All rights reserved.
//

@interface Player : NSObject {
    NSNumber *cash;
    NSString *name;
    NSNumber *rank;
    NSArray *stocks;
}

@property (nonatomic, copy) NSNumber *cash;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSNumber *rank;
@property (nonatomic, copy) NSArray *stocks;

// Parsing
+ (Player *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;
+ (Player *)instanceFromJSONString:(NSString *)string;

// Serializing
- (NSDictionary *)serializeToDictionary;
- (NSString *)serializeToJSONString;

// Content Provider
- (NSNumber *)netWorth;
- (NSNumber *)netWorthOfStocks;
- (NSNumber *)netWorthOfStock:(NSString *)stock;
- (NSNumber *)netPurchasePriceOfStock:(NSString *)stock;
- (NSNumber *)numberOfShareInStock:(NSString *)stock;

// Content Publisher
- (BOOL)purchaseSharesInStock:(NSString *)stock amount:(NSNumber *)amount;
- (BOOL)sellSharesInStock:(NSString *)stock amount:(NSNumber *)amount;
- (BOOL)purchaseMoneyAmount:(NSNumber *)amount;
- (void)synchronize;

@end
