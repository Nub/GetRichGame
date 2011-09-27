//
//  StockPurchase.h
//  
//
//  Created by Zachry Thayer on 9/23/11.
//  Copyright 2011 Zachry Thayer. All rights reserved.
//  Copyright 2011 Jos Kuijpers. All rights reserved.
//

@class StockUpdate;

@interface StockPurchase : NSObject {
    NSNumber *shares;
    StockUpdate *stockUpdate;
}

@property (nonatomic, copy) NSNumber *shares;
@property (nonatomic, retain) StockUpdate *stockUpdate;

// Parsing
+ (StockPurchase *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;
+ (StockPurchase *)instanceFromJSONString:(NSString *)string;

// Serialization
- (NSDictionary *)serializeToDictionary;
- (NSString *)serializeToJSONString;

@end
