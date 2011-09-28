//
//  ContentProvider.m
//  BiggerWallet
//
//  Created by Zachry Thayer on 9/25/11.
//  Copyright 2011 Zachry Thayer. All rights reserved.
//

#import "ContentProvider.h"
#import "JSONKit.h"

@implementation ContentProvider

@synthesize player;

- (id)init
{
    self = [super init];
    if (self) {
        // Check for player cache file
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *cacheDirectory = [paths objectAtIndex:0];
        
        NSString *playerCacheFilePath = [cacheDirectory stringByAppendingPathComponent:kContentProviderPlayerCacheFile];
        
        player = [[Player alloc] init];
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:playerCacheFilePath]) {// Cache Exists
            NSString *jsonString = [NSString stringWithContentsOfFile:playerCacheFilePath encoding:NSUTF8StringEncoding error:nil];
            
            [self.player setAttributesFromDictionary:[jsonString objectFromJSONString]];
            
        }else{// No Cache exists
            
        }
        
    }
    
    return self;
}

- (void)dealloc{
 
    [player release];
    
    [super dealloc];
    
}

- (NSArray *)searchForStocksNamed:(NSString *)name
{    
    return nil;
}

@end
