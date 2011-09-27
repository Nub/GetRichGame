//
//  StockUpdate.h
//  
//
//  Created by Zachry Thayer on 9/23/11.
//  Copyright 2011 Zachry Thayer. All rights reserved.
//  Copyright 2011 Jos Kuijpers. All rights reserved.
//

@interface StockUpdate : NSObject {
    NSNumber *date;
    NSNumber *value;
}

@property (nonatomic, copy) NSNumber *date;
@property (nonatomic, copy) NSNumber *value;

// Parsing
+ (StockUpdate *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;
+ (StockUpdate *)instanceFromJSONString:(NSString *)string;

// Serialization
- (NSDictionary *)serializeToDictionary;
- (NSString *)serializeToJSONString;

@end
