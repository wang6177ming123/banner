//
//  BannerView.m
//  Library
//
//  Created by pactera on 16/12/12.
//  Copyright © 2016年 Pactera. All rights reserved.
//

#import "BannerView.h"
@interface BannerView ()
{
    UIView *_firstView;
    UIView *_middleView;
    UIView *_lastView;
    
    float _viewWidth;
    float _viewHeight;
    
    NSTimer *_autoScrollTimer;
    
    UITapGestureRecognizer *_tap;
    BOOL startanimation;
}
@property (nonatomic, strong) NSArray <UIView *>* viewList;

@property (nonatomic) NSInteger showIndex;
@end

@implementation BannerView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _viewWidth = self.bounds.size.width;
        _viewHeight = self.bounds.size.height;
        
        //设置scrollview
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, _viewWidth, _viewHeight)];
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake(_viewWidth * 3, _viewHeight);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.delegate = self;
        
        [self addSubview:_scrollView];
        
        //设置分页
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, _viewWidth, 30)];
        _pageControl.userInteractionEnabled = NO;
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.backgroundColor = [UIColor yellowColor];
        [self addSubview:_pageControl];
       
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

#pragma mark 单击手势
-(void)handleTap:(UITapGestureRecognizer*)sender
{
    if ([_bannerdelegate respondsToSelector:@selector(didClickPage:atIndex:)]) {
        [_bannerdelegate didClickPage:self atIndex:_currentPage+1];
    }
   
}

#pragma mark 设置imageViewAry
-(void)setImageViewAry:(NSArray <UIView *>*)iViewAry
{
    if (iViewAry) {
        _viewList = iViewAry;
        _currentPage = 0; //默认为第0页
        _pageControl.numberOfPages = _viewList.count;
    }
    
    [self reloadData];
}

#pragma mark 刷新view页面
-(void)reloadData
{
    if (!_firstView) {
        NSLog(@"1");
        startanimation = YES;
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            _firstView.frame = CGRectMake(_viewWidth, 0, _viewWidth, _viewHeight);
            _middleView.frame = CGRectMake(0, 0, _viewHeight, _viewHeight);
            _lastView.frame = CGRectMake(_viewWidth*2, 0, _viewWidth, _viewHeight);
//            NSLog(@"2");
            startanimation = NO;
        } completion:^(BOOL finished) {
            
        }];
    }
   
    [_firstView removeFromSuperview];
    [_middleView removeFromSuperview];
    [_lastView removeFromSuperview];
    //从数组中取到对应的图片view加到已定义的三个view中
    if (_currentPage==0) {
        _firstView = [_viewList lastObject];
        _middleView = [_viewList objectAtIndex:_currentPage];
        _lastView = [_viewList objectAtIndex:_currentPage+1];
    }
    else if (_currentPage == _viewList.count-1)
    {
        _firstView = [_viewList objectAtIndex:_currentPage-1];
        _middleView = [_viewList objectAtIndex:_currentPage];
        _lastView = [_viewList firstObject];
    }
    else
    {
        _firstView = [_viewList objectAtIndex:_currentPage-1];
        _middleView = [_viewList objectAtIndex:_currentPage];
        _lastView = [_viewList objectAtIndex:_currentPage+1];
    }
    
    //设置三个view的frame，加到scrollview上
    _firstView.frame = CGRectMake(0, 0, _viewWidth, _viewHeight);
    _lastView.frame = CGRectMake(_viewWidth*2, 0, _viewWidth, _viewHeight);
    if (startanimation == YES) {
        _middleView.frame = CGRectMake(_viewWidth, 0, _viewWidth, _viewHeight);
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            
            _middleView.frame = CGRectMake(_viewWidth, 0, _viewWidth, _viewHeight);
            
            
        }];
    }
    [_scrollView addSubview:_firstView];
    [_scrollView addSubview:_middleView];
    [_scrollView addSubview:_lastView];
   
    //设置当前的分页
    _pageControl.currentPage = _currentPage;
    
    //显示中间页
    _scrollView.contentOffset = CGPointMake(_viewWidth, 0);
}

#pragma mark scrollvie停止滑动
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //手动滑动时候暂停自动替换
    [_autoScrollTimer invalidate];
    _autoScrollTimer = nil;
    _autoScrollTimer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(autoShowNextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:_autoScrollTimer forMode:NSDefaultRunLoopMode];
    //得到当前页数
    float x = _scrollView.contentOffset.x;
    
    //往前翻
    if (x<=0) {
        if (_currentPage-1<0) {
            _currentPage = _viewList.count-1;
        }else{
            _currentPage --;
        }
    }
    
    //往后翻
    if (x>=_viewWidth*2) {
        if (_currentPage==_viewList.count-1) {
            _currentPage = 0;
        }else{
            _currentPage ++;
        }
    }
    [self reload];
}
-(void)reload
{
    startanimation = YES;
    
    [_firstView removeFromSuperview];
    [_middleView removeFromSuperview];
    [_lastView removeFromSuperview];
    //从数组中取到对应的图片view加到已定义的三个view中
    if (_currentPage==0) {
        _firstView = [_viewList lastObject];
        _middleView = [_viewList objectAtIndex:_currentPage];
        _lastView = [_viewList objectAtIndex:_currentPage+1];
    }
    else if (_currentPage == _viewList.count-1)
    {
        _firstView = [_viewList objectAtIndex:_currentPage-1];
        _middleView = [_viewList objectAtIndex:_currentPage];
        _lastView = [_viewList firstObject];
    }
    else
    {
        _firstView = [_viewList objectAtIndex:_currentPage-1];
        _middleView = [_viewList objectAtIndex:_currentPage];
        _lastView = [_viewList objectAtIndex:_currentPage+1];
    }
    
    //设置三个view的frame，加到scrollview上
    _firstView.frame = CGRectMake(0, 0, _viewWidth, _viewHeight);
    _lastView.frame = CGRectMake(_viewWidth*2, 0, _viewWidth, _viewHeight);
    if (startanimation == YES) {
        _middleView.frame = CGRectMake(_viewWidth, 0, _viewWidth, _viewHeight);
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            
            _middleView.frame = CGRectMake(_viewWidth, 0, _viewWidth, _viewHeight);
            
            
        }];
    }
    [_scrollView addSubview:_firstView];
    [_scrollView addSubview:_middleView];
    [_scrollView addSubview:_lastView];
    
    //设置当前的分页
    _pageControl.currentPage = _currentPage;
    
    //显示中间页
    _scrollView.contentOffset = CGPointMake(_viewWidth, 0);
}
#pragma mark 自动滚动
-(void)shouldAutoShow:(BOOL)shouldStart
{
    if (shouldStart)  //开启自动翻页
    {
        if (!_autoScrollTimer) {
            _autoScrollTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(autoShowNextImage) userInfo:nil repeats:YES];
            [[NSRunLoop currentRunLoop]addTimer:_autoScrollTimer forMode:NSDefaultRunLoopMode];

        }
    }
    else   //关闭自动翻页
    {
        if (_autoScrollTimer.isValid) {
            [_autoScrollTimer invalidate];
            _autoScrollTimer = nil;
        }
    }
}

#pragma mark 展示下一页
-(void)autoShowNextImage
{
    if (_currentPage == _viewList.count-1) {
        _currentPage = 0;
    }else{
        _currentPage ++;
    }
    [self reloadData];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
