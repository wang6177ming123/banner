//
//  fourview.m
//  Library
//
//  Created by pactera on 16/12/13.
//  Copyright © 2016年 Pactera. All rights reserved.
//

#import "fourview.h"

@implementation fourview
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //       [self scrolleviewadd];
        self.backgroundColor = [UIColor yellowColor];
        NSLog(@"DB_Yellow");
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 100, 40)];
        lab.text = @"万恶的小明";
        lab.textColor = [UIColor blackColor];
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
