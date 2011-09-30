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
    NSMutableDictionary *stocks;
}

#define kPlayerCashKey      @"Cash"
#define kPlayerNameKey      @"Name"
#define kPlayerStocksKey    @"Stocks"

@property (nonatomic, copy) NSNumber *cash;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, retain) NSMutableDictionary *stocks;

// Parsing
+ (Player *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;
+ (Player *)instanceFromJSONString:(NSString *)string;

// Serializing
- (NSDictionary *)serializeToDictionary;
- (NSString *)serializeToJSONString;

@end
