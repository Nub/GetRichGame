//
//  ContentPublisher.m
//  BiggerWallet
//
//  Created by Jos Kuijpers on 9/28/11.
//  Copyright 2011 Jos Kuijpers. All rights reserved.
//

#import "ContentPublisher.h"

@implementation ContentPublisher

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}


#pragma mark - Player Publisher

- (BOOL)purchaseSharesInStock:(NSString *)stock amount:(NSNumber *)amount {
    return NO;
}

- (BOOL)sellSharesInStock:(NSString *)stock amount:(NSNumber *)amount {
    return NO;
}

- (BOOL)purchaseMoneyAmount:(NSNumber *)amount {
    return NO;
}

- (void)synchronize {
    return;
}



@end
