//
//  BiggerWalletViewController.h
//  BiggerWallet
//
//  Created by Zachry Thayer on 9/23/11.
//  Copyright 2011 Zachry Thayer. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZTInfinitePagedV.h"

@interface BiggerWalletViewController : UIViewController <ZTInfinitePagedVDataSource, ZTInfinitePagedVDelegate> {
    NSArray *testVCs;
    ZTInfinitePagedV *pagedView;
}
@property (nonatomic, retain) IBOutlet ZTInfinitePagedV *pagedView;

@property (nonatomic, retain) IBOutletCollection(UIViewController) NSArray *testVCs;

@end
