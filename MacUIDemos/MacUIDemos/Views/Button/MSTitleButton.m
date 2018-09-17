//
//  MSTitleButton.m
//  NTESAccess
//
//  Created by administrator on 2018/3/29.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import "MSTitleButton.h"

#import <Quartz/Quartz.h>
#import <CoreGraphics/CoreGraphics.h>


@interface MSTitleButton () <CALayerDelegate>

@property (nonatomic, strong) CATextLayer *titleLayer;
@property (nonatomic, assign) BOOL mouseDown;

@end

@implementation MSTitleButton

#pragma mark - Lifecycle

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
        [self setupTitleLayer];
    }
    return self;
}

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        [self setup];
        [self setupTitleLayer];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addTrackingArea:[[NSTrackingArea alloc] initWithRect:self.bounds options:NSTrackingActiveAlways|NSTrackingInVisibleRect|NSTrackingMouseEnteredAndExited owner:self userInfo:nil]];
}

#pragma mark - Drawing method

- (void)drawRect:(NSRect)dirtyRect {
    // Do nothing
}

- (BOOL)layer:(CALayer *)layer shouldInheritContentsScale:(CGFloat)newScale fromWindow:(NSWindow *)window {
    return YES;
}

#pragma mark - Setup method

- (void)setup {
    // Setup layer
    self.wantsLayer = YES;
    self.layer.masksToBounds = YES;
    self.layer.delegate = self;
    self.layer.backgroundColor = [NSColor redColor].CGColor;
    self.alphaValue = self.isEnabled ? 1.0 : 0.5;
}


- (void)setupTitleLayer {
    // Ignore title layer if has no title or imagePosition equal to NSImageOnly
    if (!self.title || self.imagePosition == NSImageOnly) {
        [self.titleLayer removeFromSuperlayer];
        return;
    }
    
    CGSize buttonSize = self.frame.size;
    CGSize imageSize = self.image.size;
    CGSize titleSize = [self.title sizeWithAttributes:@{NSFontAttributeName: self.font}];
    CGFloat x = 0.0; // Title's origin x
    CGFloat y = 0.0; // Title's origin y
    

            x = (buttonSize.width - titleSize.width) / 2.0;
            y = (buttonSize.height - titleSize.height) / 2.0;
    
    // Setup title layer
    self.titleLayer.frame = NSMakeRect(round(x), round(y), ceil(titleSize.width), ceil(titleSize.height));
    self.titleLayer.string = self.title;
    self.titleLayer.font = (__bridge CFTypeRef _Nullable)(self.font);
    self.titleLayer.fontSize = self.font.pointSize;
    [self.layer addSublayer:self.titleLayer];
}

#pragma mark - Animation method

- (void)removeAllAnimations {
    [self.layer removeAllAnimations];
    [self.layer.sublayers enumerateObjectsUsingBlock:^(CALayer * _Nonnull layer, NSUInteger index, BOOL * _Nonnull stop) {
        [layer removeAllAnimations];
    }];
}

- (void)animateColorWithState:(NSCellStateValue)state {
    [self removeAllAnimations];
    CGFloat duration = (state == NSOnState) ? self.onAnimateDuration : self.offAnimateDuration;
    NSColor *borderColor = (state == NSOnState) ? self.borderHighlightColor : self.borderNormalColor;
    NSColor *backgroundColor = (state == NSOnState) ? self.backgroundHighlightColor : self.backgroundNormalColor;
    NSColor *titleColor = (state == NSOnState) ? self.titleHighlightColor : self.titleNormalColor;
    [self animateLayer:self.layer color:borderColor keyPath:@"borderColor" duration:duration];
    [self animateLayer:self.layer color:backgroundColor keyPath:@"backgroundColor" duration:duration];
    [self animateLayer:self.titleLayer color:titleColor keyPath:@"foregroundColor" duration:duration];
}

- (void)animateLayer:(CALayer *)layer color:(NSColor *)color keyPath:(NSString *)keyPath duration:(CGFloat)duration {
    CGColorRef oldColor = (__bridge CGColorRef)([layer valueForKeyPath:keyPath]);
    if (!(CGColorEqualToColor(oldColor, color.CGColor))) {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keyPath];
        animation.fromValue = [layer valueForKeyPath:keyPath];
        animation.toValue = (id)color.CGColor;
        animation.duration = duration;
        animation.removedOnCompletion = NO;
        [layer addAnimation:animation forKey:keyPath];
        [layer setValue:(id)color.CGColor forKey:keyPath];
    }
}

#pragma mark - Event Response

- (NSView *)hitTest:(NSPoint)point {
    return self.isEnabled ? [super hitTest:point] : nil;
}

- (void)mouseDown:(NSEvent *)event {
    if (self.isEnabled) {
        self.mouseDown = YES;
        self.state = (self.state == NSOnState) ? NSOffState : NSOnState;
    }
}

- (void)mouseEntered:(NSEvent *)event {
    if (self.mouseDown) {
        self.state = (self.state == NSOnState) ? NSOffState : NSOnState;
    }
}

- (void)mouseExited:(NSEvent *)event {
    if (self.mouseDown) {
        self.mouseDown = NO;
        self.state = (self.state == NSOnState) ? NSOffState : NSOnState;
    }
}

- (void)mouseUp:(NSEvent *)event {
    if (self.mouseDown) {
        self.mouseDown = NO;
        if (self.momentary) {
            self.state = (self.state == NSOnState) ? NSOffState : NSOnState;
        }
        [NSApp sendAction:self.action to:self.target from:self];
    }
}


#pragma mark -

- (void)msSetCommonStyle{
    
    
    [self msSetCornerRadius:4];
    
    self.backgroundNormalColor = [NSColor lightGrayColor];
    self.backgroundHighlightColor = [NSColor lightGrayColor];
    
    self.borderNormalColor = [NSColor clearColor];
    self.borderHighlightColor = [NSColor clearColor];
    
    self.titleNormalColor = [NSColor whiteColor];
    self.titleHighlightColor = [NSColor whiteColor];
    
}

#pragma mark - Property method

- (void)setFrame:(NSRect)frame {
    [super setFrame:frame];
    [self setupTitleLayer];
}

- (void)setFont:(NSFont *)font {
    [super setFont:font];
    [self setupTitleLayer];
}

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    [self setupTitleLayer];
}

- (void)setState:(NSInteger)state {
    [super setState:state];
    [self animateColorWithState:state];
}


- (void)setMomentary:(BOOL)momentary {
    _momentary = momentary;
    [self animateColorWithState:self.state];
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = _cornerRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    self.layer.borderWidth = _borderWidth;
}

- (void)setSpacing:(CGFloat)spacing {
    _spacing = spacing;
    [self setupTitleLayer];
}

- (void)setBorderNormalColor:(NSColor *)borderNormalColor {
    _borderNormalColor = borderNormalColor;
    [self animateColorWithState:self.state];
}

- (void)setBorderHighlightColor:(NSColor *)borderHighlightColor {
    _borderHighlightColor = borderHighlightColor;
    [self animateColorWithState:self.state];
}

- (void)setBackgroundNormalColor:(NSColor *)backgroundNormalColor {
    _backgroundNormalColor = backgroundNormalColor;
    if (!_backgroundHighlightColor) {
        _backgroundHighlightColor = _backgroundNormalColor;
    }
    [self animateColorWithState:self.state];
}


-(void)setBackgroundColor:(NSColor *)backgroundColor{
    _backgroundNormalColor = backgroundColor;
    _backgroundHighlightColor = backgroundColor;
    [self animateColorWithState:self.state];
}

- (void)setBackgroundHighlightColor:(NSColor *)backgroundHighlightColor {
    _backgroundHighlightColor = backgroundHighlightColor;
    if (!_backgroundNormalColor) {
        _backgroundNormalColor = _backgroundHighlightColor;
    }
    [self animateColorWithState:self.state];
}


- (void)setTitleNormalColor:(NSColor *)titleNormalColor {
    _titleNormalColor = titleNormalColor;
    if (!_titleHighlightColor) {
        _titleHighlightColor = _titleNormalColor;
    }
    [self animateColorWithState:self.state];
}

- (void)setTitleHighlightColor:(NSColor *)titleHighlightColor {
    _titleHighlightColor = titleHighlightColor;
    if (!_titleNormalColor) {
        _titleNormalColor = _titleHighlightColor;
    }
    [self animateColorWithState:self.state];
}

- (CATextLayer *)titleLayer {
    if (_titleLayer == nil) {
        _titleLayer = [[CATextLayer alloc] init];
        _titleLayer.delegate = self;
    }
    return _titleLayer;
}

@end

