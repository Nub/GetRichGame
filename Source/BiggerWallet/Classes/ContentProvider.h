//
//  ContentProvider.h
//  BiggerWallet
//
//  Created by Zachry Thayer on 9/25/11.
//  Copyright 2011 Penguins With Mustaches. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

#define kContentProviderPlayerCacheFile @"playerCache.json"

@interface ContentProvider : NSObject{
    
    Player *player;
    
}


@property (nonatomic, retain) Player *player;

@end
