//
//  BiggerWalletViewController.h
//  BiggerWallet
//
//  Created by Zachry Thayer on 9/23/11.
//  Copyright 2011 Zachry Thayer. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BWPagedView.h"

@interface BiggerWalletViewController : UIViewController <BWPagedViewDelegate, BWPagedViewDataSource> {
    NSArray *testVCs;
    BWPagedView *pagedView;
}
@property (nonatomic, retain) IBOutlet BWPagedView *pagedView;

@property (nonatomic, retain) IBOutletCollection(UIViewController) NSArray *testVCs;

@end
