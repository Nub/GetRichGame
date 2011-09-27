//
//  BiggerWalletAppDelegate.h
//  BiggerWallet
//
//  Created by Zachry Thayer on 9/23/11.
//  Copyright 2011 Zachry Thayer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BiggerWalletViewController;

@interface BiggerWalletAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet BiggerWalletViewController *viewController;

@end
