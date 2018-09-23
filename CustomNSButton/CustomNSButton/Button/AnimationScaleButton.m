//
//  AnimationScaleButton.m
//  2Android-Practice
//
//  Created by zhuzhanlong on 2018/9/4.
//  Copyright © 2018年 Digiarty. All rights reserved.
//

#import "AnimationScaleButton.h"
#import <Quartz/Quartz.h>

@implementation AnimationScaleButton

- (void)awakeFromNib {
    [super awakeFromNib];
    _isScaleAnimation = YES;
}

- (void)setFrame:(NSRect)frame {
    [super setFrame:frame];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
}

- (void)mouseEntered:(NSEvent *)event {
    if (_isScaleAnimation && self.enabled) {
        _scaleLargerAnim = [self scaleAnimationView:self fromScale:1.0 toScale:1.05 delegate:self];
    }
    [super mouseEntered:event];
}

- (void)mouseExited:(NSEvent *)event {
    if (_scaleLargerAnim != nil) {
        _scaleSmallAnim = [self scaleAnimationView:self fromScale:1.05 toScale:1.0 delegate:self];
    }
    [super mouseExited:event];
}

//缩放动画
-(CAAnimation *)scaleAnimationView:(NSView *)view fromScale:(float)fromScale toScale:(float)toScale delegate:(id)delegate{
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.delegate = delegate;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.removedOnCompletion = NO;
    scaleAnimation.fromValue = [NSNumber numberWithFloat:fromScale];
    scaleAnimation.toValue = [NSNumber numberWithFloat:toScale];
    scaleAnimation.duration = 0.3f;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    NSRect rect = view.frame;
    NSPoint centerPoint = NSMakePoint(NSMidX(rect), NSMidY(rect));
    view.layer.position = centerPoint;
    view.layer.anchorPoint = NSMakePoint(0.5, 0.5);
    
    [view.layer addAnimation:scaleAnimation forKey:@"animationGroup"];
    return scaleAnimation;
}

#pragma mark - setter方法
- (void)setIsScaleAnimation:(BOOL)isScaleAnimation {
    _isScaleAnimation = isScaleAnimation;
    [self setNeedsDisplay:YES];
}
@end
