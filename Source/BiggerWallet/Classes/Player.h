//
//  Player.h
//  
//
//  Created by Zachry Thayer on 9/23/11.
//  Copyright 2011 Penguins With Mustaches. All rights reserved.
//

#import <Cocoa/Cocoa.h>

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

+ (Player *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
