//
//  NSWindow+Storm.m
//  MacUIDemos
//
//  Created by MelissaShu on 2018/9/17.
//  Copyright © 2018年 MS. All rights reserved.
//

#import "NSWindow+Storm.h"
#import "NSView+Storm.h"

@implementation NSWindow (Storm)


- (void)msCommonSetting{
    
    self.movableByWindowBackground = YES;
    [self.contentView msSetLayerColor:[NSColor whiteColor]];
    [self standardWindowButton:NSWindowZoomButton].hidden = YES;//// 隐藏最大化按钮

}

- (void)msNoTitleBar{
    
    self.titlebarAppearsTransparent = YES;
    self.titleVisibility = NSWindowTitleHidden;
    [self setStyleMask:[self styleMask] | NSWindowStyleMaskFullSizeContentView];
}

@end
