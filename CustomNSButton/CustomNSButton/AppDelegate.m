//
//  AppDelegate.m
//  CustomNSButton
//
//  Created by 朱占龙 on 2018/9/23.
//  Copyright © 2018 giarity. All rights reserved.
//

#import "AppDelegate.h"
#import "Button/ThreeStateButton.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet ThreeStateButton *syncButton;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

-(void)awakeFromNib {
    _syncButton.normalImage = [NSImage imageNamed:@"button_nor"];
    _syncButton.mouseUpImage =  [NSImage imageNamed:@"button_on"];
    _syncButton.disImage = [NSImage imageNamed:@"button_dis"];
    _syncButton.btnTitle = @"哈哈哈";
    _syncButton.titleFont = [NSFont fontWithName:@"Tahoma Bold" size:23];
    _syncButton.downMargin = -2;
}
@end
