//
//  MSTitleButton.h
//  NTESAccess
//
//  Created by administrator on 2018/3/29.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MSTitleButton : NSButton

@property (nonatomic, assign) IBInspectable BOOL momentary;                     // Default:NO   - Restore button state when mouse up
@property (nonatomic, assign) IBInspectable CGFloat onAnimateDuration;          // Default:0.0  - The animation duration from NSOffState to NSOnState
@property (nonatomic, assign) IBInspectable CGFloat offAnimateDuration;         // Default:0.0  - The animation duration from NSOnState to NSOffState
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;               // Default:0.0  - Button's border corner radius
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;                // Default:0.0  - Button's border width
@property (nonatomic, assign) IBInspectable CGFloat spacing;                    // Default:0.0  - Button's spacint between image and title
@property (nonatomic, strong) IBInspectable NSColor *borderNormalColor;         // Default:nil  - Button's border color when state off
@property (nonatomic, strong) IBInspectable NSColor *borderHighlightColor;      // Default:nil  - Button's border color when state on
@property (nonatomic, strong) IBInspectable NSColor *backgroundColor;
@property (nonatomic, strong) IBInspectable NSColor *backgroundNormalColor;     // Default:nil  - Button's background color when state off
@property (nonatomic, strong) IBInspectable NSColor *backgroundHighlightColor;  // Default:nil  - Button's background color when state on

@property (nonatomic, strong) IBInspectable NSColor *titleNormalColor;          // Default:nil  - Button's title color when state off
@property (nonatomic, strong) IBInspectable NSColor *titleHighlightColor;       // Default:nil  - Button's title color when state on


- (void)msSetCommonStyle;

@end
