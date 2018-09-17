//
//  MSImageView.m
//  NTESAccess
//
//  Created by administrator on 2018/4/8.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import "MSImageView.h"

@implementation MSImageView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (id)initWithFrame:(NSRect)frame
              style:(MSImageStyle)style
           andImage:(NSImage*)image{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.layer = [[CALayer alloc] init];
        
        if (style == MSImageStyleAspect) {
            self.layer.contentsGravity = kCAGravityResizeAspect;
        }else if (style == MSImageStyleAspectFill){
            self.layer.contentsGravity = kCAGravityResizeAspectFill;
        }
        
        self.layer.contents = image;
        self.wantsLayer = YES;
    }
    return self;
}


@end
