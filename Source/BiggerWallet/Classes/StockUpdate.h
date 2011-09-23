//
//  StockUpdate.h
//  
//
//  Created by Zachry Thayer on 9/23/11.
//  Copyright 2011 Penguins With Mustaches. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface StockUpdate : NSObject {
    NSNumber *date;
    NSNumber *value;
}

@property (nonatomic, copy) NSNumber *date;
@property (nonatomic, copy) NSNumber *value;

+ (StockUpdate *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
