//
//  NSButton+Storm.m
//  MacUIDemos
//
//  Created by MelissaShu on 2018/9/17.
//  Copyright © 2018年 MS. All rights reserved.
//

#import "NSButton+Storm.h"

@implementation NSButton (Storm)

- (void)msSetLayerColor:(NSColor *)layerColor{
    
    self.wantsLayer = YES;
    self.layer.backgroundColor = layerColor.CGColor;
    
}

- (void)msSetCornerRadius:(CGFloat)cornerRadius{
    self.wantsLayer = YES;
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}


- (void)msSetBorderWidth:(NSInteger)width color:(NSColor *)color{
    
    self.wantsLayer = YES;
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}

@end
