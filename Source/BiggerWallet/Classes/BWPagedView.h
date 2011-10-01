//
//  BWPagedView.h
//  BiggerWallet
//
//  Created by Zachry Thayer on 9/30/11.
//  Copyright Zachry Thayer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BWPagedView;

@protocol BWPagedViewDataSource

- (NSInteger)numberOfPagesInPagedView:(BWPagedView *)pagedView;

// 0 indexed
- (UIViewController*)pagedView:(BWPagedView *)pagedView viewControllerForPage:(NSInteger)page;

@end

@protocol BWPagedViewDelegate <UIScrollViewDelegate>

// Page is going to become within 1 of onscreen page
- (void)pagedView:(BWPagedView *)pagedView willNeedPage:(NSInteger)page;

//Page is will move more than 1 away from onscreenpage
- (void)pagedView:(BWPagedView *)pagedView willNoLongerNeedPage:(NSInteger)page;

//Page is currently on screen
- (void)pagedView:(BWPagedView *)pagedView didFocusePage:(NSInteger)page;


@end


@interface BWPagedView : UIScrollView <UIScrollViewDelegate>
{
    NSMutableArray *pageViewControllers;
    
    NSInteger _internalPage;
    NSInteger page;
    
    id <BWPagedViewDelegate> delegate;
    id <BWPagedViewDataSource> dataSource;
    
    BOOL infinitePaging;
    
}


@property (nonatomic, assign) id <BWPagedViewDelegate> delegate;
@property (nonatomic, assign) id <BWPagedViewDataSource> dataSource;

@property (nonatomic, retain) NSMutableArray *pageViewControllers;
@property (nonatomic) NSInteger page;

@property (nonatomic) BOOL infinitePaging;

@end
