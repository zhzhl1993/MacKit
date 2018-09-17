//
//  NSScrollView+Storm.m
//  MacUIDemos
//
//  Created by MelissaShu on 2018/9/17.
//  Copyright © 2018年 MS. All rights reserved.
//

#import "NSScrollView+Storm.h"

@implementation NSScrollView (Storm)

- (void)msCommonStyle{
    
    self.scrollsDynamically = YES;
    self.hasHorizontalScroller = NO;
    self.hasVerticalScroller = NO;
    
    self.translatesAutoresizingMaskIntoConstraints = YES;
    
    self.autohidesScrollers = YES;//自动隐藏滚动条（滚动的时候出现）
    
    [self setDrawsBackground:NO];//不画背景（背景默认画成白色）
    
    [self msSetLayerColor:[NSColor whiteColor]];
}
@end
