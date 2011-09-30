//
//  ContentProvider.m
//  BiggerWallet
//
//  Created by Zachry Thayer on 9/25/11.
//  Copyright 2011 Zachry Thayer. All rights reserved.
//  Copyright 2011 Jos Kuijpers. All rights reserved.
//

#import "ContentProvider.h"
#import "JSONKit.h"
#import "ContentManager.h"
#import "BWNetworking.h"

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
            
        } else {// No Cache exists
            
            NSString *testPlayer = [[NSBundle mainBundle] pathForResource:@"testPlayer" ofType:@"json"];
            
            NSString *jsonString = [NSString stringWithContentsOfFile:testPlayer encoding:NSUTF8StringEncoding error:nil];
            
            [self.player setAttributesFromDictionary:[jsonString objectFromJSONString]];
        }
        
    }
    
    return self;
}

- (void)dealloc{
 
    [player release];
    
    [super dealloc];
    
}

#pragma mark - Player Provider

#pragma mark - Stock Provider

- (void)searchForStocksNamed:(NSString *)name 
                  completion:(void(^)(NSArray *data))block
{    
    BWNetworking *net = [[ContentManager singleton] networking];
    
    void (^myBlock)(NSArray *data) = [block copy];
    
    [net getFromCollection:@"stock"
                parameters:[NSArray arrayWithObjects:@"find",name,nil]
                completion:^(NSString *collection, NSArray *param, id ret) {
                    if(myBlock)
                        myBlock(ret);
                    [myBlock release];
                }];
    
}

@end
