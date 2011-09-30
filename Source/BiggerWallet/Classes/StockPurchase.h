//
//  StockPurchase.h
//  
//
//  Created by Zachry Thayer on 9/23/11.
//  Copyright 2011 Zachry Thayer. All rights reserved.
//  Copyright 2011 Jos Kuijpers. All rights reserved.
//

@interface StockPurchase : NSObject {
    NSNumber *shares;
    NSNumber *price;
    NSString *date;
}

#define kStockUpdateSharesKey   @"Shares"
#define kStockUpdatePriceKey   @"Price"
#define kStockUpdatsDateKey     @"Date"

@property (nonatomic, retain) NSNumber *shares;
@property (nonatomic, retain) NSNumber *price;
@property (nonatomic, retain) NSString *date;

// Parsing
+ (StockPurchase *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;
+ (StockPurchase *)instanceFromJSONString:(NSString *)string;

// Serialization
- (NSDictionary *)serializeToDictionary;
- (NSString *)serializeToJSONString;

@end
