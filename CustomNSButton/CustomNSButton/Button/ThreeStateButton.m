//
//  ThreeStateButton.m
//  2Android-Practice
//
//  Created by zhuzhanlong on 2018/8/30.
//  Copyright © 2018年 Digiarty. All rights reserved.
//

#import "ThreeStateButton.h"

@implementation ThreeStateButton

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _leftMargin = 0;
    _isChangeTextRect = NO;
    _isShadow = NO;
    _isTitleCenter = YES;
    _normalColor = [NSColor whiteColor];
    _mouseEnterColor = [NSColor whiteColor];
    _mousedownColor = [NSColor whiteColor];
    //样式配置
    [self setBezelStyle:NSBezelStyleRegularSquare];
    [self setButtonType:NSButtonTypeMomentaryChange];
    [self setBordered:NO];
    [self setTitle:@""];
    [self setImageScaling:NSImageScaleAxesIndependently];
    [self setState:NSControlStateValueOn];
    [self addTrackingRect:self.bounds owner:self userData:nil assumeInside:NO];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    [self drawTitleRect:dirtyRect];
}

//绘制标题
- (void)drawTitleRect:(NSRect)dirtyRect {
    if (_isShadow && _buttonShadow != nil && self.enabled) {
        [_buttonShadow set];
    }
    NSString *btnStr=_btnTitle;
    if (btnStr != nil) {
        NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:btnStr];
        NSRange range = NSMakeRange(0, btnStr.length);
        NSMutableDictionary *mutDict = [NSMutableDictionary dictionary];
        
        if (_titleFont != nil) {
            [mutDict setObject:_titleFont forKey:NSFontAttributeName];
        }
        if (_isChangeTextRect) {
            NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
            [style setLineBreakMode:NSLineBreakByTruncatingTail];
            [mutDict setObject:style forKey:NSParagraphStyleAttributeName];
        }
        switch (_mouseType) {
            case mouseEnterType:
            case mouseMoveType: {
                if (_mouseEnterColor != nil) {
                    [mutDict setObject:_mouseEnterColor forKey:NSForegroundColorAttributeName];
                }
            }
                break;
            case mouseExited:
            case mouseUpType:{
                if (_normalColor != nil) {
                    [mutDict setObject:_normalColor forKey:NSForegroundColorAttributeName];
                }
            }
                break;
            case mouseDownType: {
                if (!self.cell.isHighlighted) {
                    [mutDict setObject:_normalColor forKey:NSForegroundColorAttributeName];
                }else {
                    [mutDict setObject:_mousedownColor forKey:NSForegroundColorAttributeName];
                }
            }
                break;
            default:
                break;
        }
        
        //按钮为禁用状态
        if (!self.enabled) {
            if (_normalColor != nil) {
                [mutDict setObject:_normalColor forKey:NSForegroundColorAttributeName];
            }
            if (_disableColor != nil) {
                [mutDict setObject:_disableColor forKey:NSForegroundColorAttributeName];
            }
        }
        
        [attributeStr addAttributes:mutDict range:range];
        
        if (_attributesDic != nil) {
            [attributeStr addAttributes:_attributesDic range:range];
        }
        
        NSSize fontSize = [btnStr sizeWithAttributes:mutDict];
        float height = fontSize.height;
        
        if (_isTitleCenter && _titleFont != nil) {
            float width = [self getStringWidthWithString:btnStr fontSize: _titleFont];
            _leftMargin = (dirtyRect.size.width - width) / 2;
        }
        
        CGFloat x = NSMinX(dirtyRect) + _leftMargin;
        CGFloat y = NSMinY(dirtyRect)+dirtyRect.size.height * 0.5 - height*0.5;
        CGFloat rectWidth = dirtyRect.size.width - _leftMargin * 2;
        CGFloat rectHeight = height;
        NSRect rect = NSMakeRect(x, y, rectWidth, rectHeight);
        
        if (_isChangeTextRect) {
            NSRect tempRect = NSOffsetRect(_textRect, 0, _downMargin);
            [attributeStr drawInRect:tempRect];
        }else {
            NSRect tempRect = NSOffsetRect(rect, 0, _downMargin);
            [attributeStr drawInRect:tempRect];
        }
    }
}

- (float)getStringWidthWithString:(NSString *)str fontSize:(NSFont *)font {
    if (str == nil || font == nil) {
        return 0;
    }
    NSMutableDictionary *mutDict = [NSMutableDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    return [[[NSMutableAttributedString alloc] initWithString:str attributes:mutDict] size].width;
}

#pragma mark - setter方法
- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    if (self.isEnabled) {
        [self setImage:_normalImage];
    }else {
        if (self.disImage != nil) {
            [self setImage:_disImage];
        }
    }
}

- (void)setNormalImage:(NSImage *)normalImage {
    if ([_normalImage isEqual:normalImage]) {
        return;
    }
    _normalImage = normalImage;
    [self setNeedsDisplay:YES];
}

- (void)setMouseUpImage:(NSImage *)mouseUpImage {
    if ([_mouseUpImage isEqual:mouseUpImage]) {
        return;
    }
    _mouseUpImage = mouseUpImage;
    [self setNeedsDisplay:YES];
}

- (void)setDisImage:(NSImage *)disImage {
    if ([_disImage isEqual:disImage]) {
        return;
    }
    _disImage = disImage;
    [self setNeedsDisplay:YES];
}

- (void)setNormalColor:(NSColor *)normalColor {
    _normalColor = normalColor;
    [self setNeedsDisplay:YES];
}
- (void)setMousedownColor:(NSColor *)mousedownColor {
    _mousedownColor = mousedownColor;
    [self setNeedsDisplay:YES];
}

- (void)setMouseEnterColor:(NSColor *)mouseEnterColor {
    _mousedownColor = mouseEnterColor;
    [self setNeedsDisplay:YES];
}

- (void)setDisableColor:(NSColor *)disableColor {
    _disableColor = disableColor;
    [self setNeedsDisplay:YES];
}

- (void)setBtnTitle:(NSString *)btnTitle {
    if ([_btnTitle isEqualToString:btnTitle]) {
        return;
    }
    _btnTitle = btnTitle;
    [self setNeedsDisplay:YES];
}

- (void)setTitleFont:(NSFont *)titleFont {
    if ([_titleFont isEqual:titleFont]) {
        return;
    }
    _titleFont = titleFont;
    [self setNeedsDisplay:YES];
}
- (void)setAttributesDic:(NSDictionary *)attributesDic {
    _attributesDic = attributesDic;
    [self setNeedsDisplay:YES];
}

- (void)setTextRect:(NSRect)textRect {
    _textRect = textRect;
        _isChangeTextRect = YES;
        [self setNeedsDisplay:YES];
}
- (void)setDownMargin:(float)downMargin {
    _downMargin = downMargin;
    [self setNeedsDisplay:YES];
}
- (void)setIsTitleCenter:(BOOL)isTitleCenter {
    _isTitleCenter = isTitleCenter;
    [self setNeedsDisplay:YES];
}

- (void)setButtonShadow:(NSShadow *)buttonShadow {
    _buttonShadow = buttonShadow;
    _isShadow = YES;
    [self setNeedsDisplay:YES];
}

- (void)setMouseType:(MouseType)mouseType {
    _mouseType = mouseType;
    [self setNeedsDisplay:YES];
}

#pragma mark - 鼠标事件监听
- (void)mouseEntered:(NSEvent *)event {
    _mouseType = mouseEnterType;
    if (_mouseUpImage != nil) {
        if (self.isEnabled) {
            [self setImage:_mouseUpImage];
        }else {
            [self setImage:_disImage];
        }
    }
    [super mouseEntered:event];
}

- (void)mouseExited:(NSEvent *)event {
    _mouseType = mouseExited;
    if (_normalImage != nil) {
        if (self.isEnabled) {
            [self setImage:_normalImage];
        }else {
            [self setImage:_disImage];
        }
    }
    [super mouseExited:event];
}

- (void)mouseDown:(NSEvent *)event {
    _mouseType = mouseDownType;
    if (_normalImage != nil) {
        if (self.isEnabled) {
            [self setImage:_mouseUpImage];
        }else {
            [self setImage:_disImage];
        }
    }
    [super mouseDown:event];
}

@end
