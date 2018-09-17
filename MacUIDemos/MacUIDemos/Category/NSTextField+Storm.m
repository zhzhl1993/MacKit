//
//  NSTextField+Storm.m
//  MacUIDemos
//
//  Created by MelissaShu on 2018/9/17.
//  Copyright © 2018年 MS. All rights reserved.
//

#import "NSTextField+Storm.h"

@implementation NSTextField (Storm)

- (void)msInputStyle{
    self.bordered = NO;
    self.editable = YES;
    self.font = [NSFont systemFontOfSize:14];
//    self.textColor = kColor_TextBlack;
    
    [self setFocusRingType:NSFocusRingTypeNone];
}

- (void)msLabelStyle{
    self.editable = NO;
    self.bordered = NO;
    self.font = [NSFont systemFontOfSize:14];
//    self.textColor = kColor_TextBlack;
    
    self.backgroundColor = [NSColor clearColor];
}
@end
