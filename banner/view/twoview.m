//
//  twoview.m
//  Library
//
//  Created by pactera on 16/12/12.
//  Copyright © 2016年 Pactera. All rights reserved.
//

#import "twoview.h"

@implementation twoview
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //       [self scrolleviewadd];
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
         NSLog(@"DB_Green");
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 100, 40)];
        lab.text = @"伟大的小明";
        lab.textColor = [UIColor redColor];
        lab.backgroundColor = [UIColor whiteColor];
        [self addSubview:lab];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
