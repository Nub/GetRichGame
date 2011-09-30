//
//  BWConnection.h
//  BiggerWallet
//
//  Created by Jos Kuijpers on 9/30/11.
//  Copyright 2011 Penguins With Mustaches. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^BWCompletionBlock)(NSString *collection,
                                  NSArray *param,
                                  id ret);

@interface BWNetworking : NSObject
{
    NSURL *apiURL;
    
    NSMutableDictionary *connections;
}

@property (retain) NSURL *apiURL;

- (void)getFromCollection:(NSString *)collection
               parameters:(NSArray *)param
               completion:(BWCompletionBlock)block;

- (void)postToCollection:(NSString *)collection
                    data:(NSData *)data
              parameters:(NSArray *)param
              completion:(BWCompletionBlock)block;

- (void)putToCollection:(NSString *)collection
                    data:(NSData *)data
              parameters:(NSArray *)param
              completion:(BWCompletionBlock)block;

@end