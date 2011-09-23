//
//  Stock.h
//  
//
//  Created by Zachry Thayer on 9/23/11.
//  Copyright 2011 Penguins With Mustaches. All rights reserved.
//

@interface Stock : NSObject {
    NSString *name;
    NSArray *purchases;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSArray *purchases;

+ (Stock *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
