//
//  ThreeStateButton.h
//  2Android-Practice
//  该文件主要定义有三个状态的按钮，然后给三个状态显示三种图片
//  Created by zhuzhanlong on 2018/8/30.
//  Copyright © 2018年 Digiarty. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef enum {
    mouseExited,
    mouseEnterType,
    mouseMoveType,
    mouseDownType,
    mouseUpType,
    mouseDragType,
}MouseType;

@interface ThreeStateButton : NSButton {
    int _leftMargin;
    BOOL _isChangeTextRect;
    BOOL _isShadow;//是否有阴影
    MouseType _mouseType;
}

@property (nonatomic, strong) NSImage *normalImage;//正常状态下显示的图片
@property (nonatomic, strong) NSImage *mouseUpImage;//鼠标悬浮状态和弹起状态
@property (nonatomic, strong) NSImage *disImage;//禁止状态下的图片

@property (nonatomic,strong) NSColor *normalColor;
@property (nonatomic,strong) NSColor *mouseEnterColor;
@property (nonatomic,strong) NSColor *mousedownColor;
@property (nonatomic,strong) NSColor *disableColor;//button禁用时字体颜色

@property (nonatomic, copy) NSString *btnTitle;//按钮文字
@property (nonatomic, strong) NSFont *titleFont;//标题字体
@property (nonatomic, strong) NSDictionary *attributesDic;//字体属性
@property (nonatomic) NSRect textRect;//改变文字矩形位置
@property (nonatomic) float downMargin;//文字距下边的距离
@property (nonatomic) BOOL isTitleCenter;//是否文字居中
@property (nonatomic,strong) NSShadow *buttonShadow;
@property (nonatomic) MouseType mouseType;//鼠标类型

@end



