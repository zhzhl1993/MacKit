//
//  NSTableView+Storm.m
//  MacUIDemos
//
//  Created by MelissaShu on 2018/9/17.
//  Copyright © 2018年 MS. All rights reserved.
//

#import "NSTableView+Storm.h"

@implementation NSTableView (Storm)

- (void)msSimpleStyle{
    
    
    self.focusRingType = NSFocusRingTypeNone;//tableview获得焦点时的风格
    //    NSFocusRingTypeDefault NSFocusRingTypeNone
    
    self.selectionHighlightStyle = NSTableViewSelectionHighlightStyleNone;//行高亮的风格
    
    self.usesAlternatingRowBackgroundColors = NO; //背景颜色的交替，一行白色，一行灰色。设置后，原来设置的 backgroundColor 就无效了。
    
    [self msSetLayerColor:[NSColor whiteColor]];
}
@end
