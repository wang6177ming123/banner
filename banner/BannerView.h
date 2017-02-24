//
//  BannerView.h
//  Library
//
//  Created by pactera on 16/12/12.
//  Copyright © 2016年 Pactera. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BannerViewDelegate;

@interface BannerView : UIView <UIScrollViewDelegate>
{
    __unsafe_unretained id <BannerViewDelegate> _delegate;
}

@property (nonatomic, assign) id <BannerViewDelegate> bannerdelegate;

@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, readonly) UIScrollView *scrollView;

@property (nonatomic, readonly) UIPageControl *pageControl;

-(void)shouldAutoShow:(BOOL)shouldStart;
- (id)initWithFrame:(CGRect)frame;
-(void)setImageViewAry:(NSArray <UIView *>*)iViewAry;
@end

@protocol BannerViewDelegate <NSObject>

@optional
- (void)didClickPage:(BannerView *)view atIndex:(NSInteger)index;

@end
