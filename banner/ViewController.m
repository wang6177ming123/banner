//
//  ViewController.m
//  banner
//
//  Created by pactera on 17/2/22.
//  Copyright © 2017年 pactera. All rights reserved.
//

#import "ViewController.h"

#import "BannerView.h"
#import "oneview.h"
#import "twoview.h"
#import "threeview.h"
#import "fourview.h"
@interface ViewController ()<BannerViewDelegate>

@property (nonatomic, strong) UILabel *currentLabel;

@property (strong , nonatomic) oneview *oneView;
@property (strong , nonatomic) twoview *twoView;
@property (strong , nonatomic) threeview *threeView;
@property (strong , nonatomic) fourview *fourview;
@property (nonatomic, strong) NSArray <UIView *>* viewList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
    [self fuction:9999];
}
- (int)fuction:(int)x
{
    int nCountX = 0;
    while (x) {
        nCountX++;
        x=x&(x-1);
        
    }
    NSLog(@"x %d==%d",x,nCountX);
    return nCountX;
}
-(void)initUI{
    
    
    
    _oneView = [[oneview alloc]init];
    _threeView = [[threeview alloc]init];
    _twoView = [[twoview alloc]init];
    _fourview = [[fourview alloc]init];
    
    BannerView *bannerview = [[BannerView alloc]initWithFrame:
                              CGRectMake(0, 74 + 345, self.view.frame.size.width, 301)];
    [bannerview setImageViewAry:@[_oneView,_twoView,_threeView,_fourview]];
    [bannerview shouldAutoShow:YES];
    bannerview.bannerdelegate = self;
    [self.view addSubview:bannerview];
    
}




- (void)didClickPage:(BannerView *)view atIndex:(NSInteger)index{
    NSLog(@"banner==%ld",(long)index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
