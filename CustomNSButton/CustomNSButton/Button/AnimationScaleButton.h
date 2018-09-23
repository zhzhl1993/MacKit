//
//  AnimationScaleButton.h
//  2Android-Practice
//  继承自ThreeStateButton类，该类主要用作定义鼠标进入和移除时的动画效果，以及移位效果
//  Created by zhuzhanlong on 2018/9/4.
//  Copyright © 2018年 Digiarty. All rights reserved.
//

#import "ThreeStateButton.h"

@interface AnimationScaleButton : ThreeStateButton {
    CAAnimation *_scaleLargerAnim;
    CAAnimation *_scaleSmallAnim;
}

@property (nonatomic) BOOL isScaleAnimation;
@property (nonatomic) NSRect saveRect;

@end
