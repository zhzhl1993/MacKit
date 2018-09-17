//
//  NSButton+Storm.h
//  MacUIDemos
//
//  Created by MelissaShu on 2018/9/17.
//  Copyright © 2018年 MS. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSButton (Storm)


- (void)msSetLayerColor:(NSColor *)layerColor;

- (void)msSetCornerRadius:(CGFloat)cornerRadius;

- (void)msSetBorderWidth:(NSInteger)width color:(NSColor *)color;


@end
