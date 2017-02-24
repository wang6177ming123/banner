//
//  threeview.m
//  Library
//
//  Created by pactera on 16/12/12.
//  Copyright © 2016年 Pactera. All rights reserved.
//

#import "threeview.h"

@implementation threeview
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //       [self scrolleviewadd];
        self.backgroundColor = [UIColor orangeColor];
        NSLog(@"DB_Blue");
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 100, 40)];
        lab.text = @"无敌的小明";
//        lab.textColor = DB_Black;
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
