//
//  oneview.m
//  Library
//
//  Created by pactera on 16/12/12.
//  Copyright © 2016年 Pactera. All rights reserved.
//

#import "oneview.h"

@implementation oneview
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //       [self scrolleviewadd];
        self.backgroundColor =  [UIColor redColor];
;
        NSLog(@"red");
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
