//
//  MSTableCornerView.m
//  NSTableViewDemo
//
//  Created by administrator on 2018/9/9.
//  Copyright © 2018年 MS. All rights reserved.
//

#import "MSTableCornerView.h"

@implementation MSTableCornerView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [[NSColor colorWithCalibratedRed: 242/255.0 green:242/255.0 blue:242/255.0 alpha:1] setFill];
    NSRectFill(dirtyRect);
    
    NSBezierPath *line = [NSBezierPath bezierPath];
    [line setLineWidth:1];
    [[NSColor colorWithCalibratedRed: 242/255.0 green:242/255.0 blue:242/255.0 alpha:1] setStroke];
    
    NSPoint endPoint = dirtyRect.origin;
    endPoint.x += dirtyRect.size.width;
    [line moveToPoint:dirtyRect.origin];
    [line lineToPoint:endPoint];
    [line stroke];
    
    NSPoint buttomBegin = dirtyRect.origin;
    buttomBegin.y += dirtyRect.size.height;
    NSPoint buttomEnd = endPoint;
    buttomEnd.y += dirtyRect.size.height;
    [line moveToPoint:buttomBegin];
    [line lineToPoint:buttomEnd];
    [line stroke];
}

@end
