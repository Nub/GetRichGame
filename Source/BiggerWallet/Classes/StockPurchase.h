//
//  StockPurchase.h
//  
//
//  Created by Zachry Thayer on 9/23/11.
//  Copyright 2011 Penguins With Mustaches. All rights reserved.
//

@class StockUpdate;

@interface StockPurchase : NSObject {
    NSNumber *shares;
    StockUpdate *stockUpdate;
}

@property (nonatomic, copy) NSNumber *shares;
@property (nonatomic, retain) StockUpdate *stockUpdate;

+ (StockPurchase *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
