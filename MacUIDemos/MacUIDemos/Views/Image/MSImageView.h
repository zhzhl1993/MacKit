//
//  MSImageView.h
//  NTESAccess
//
//  Created by administrator on 2018/4/8.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import <Cocoa/Cocoa.h>


typedef NS_ENUM(NSUInteger, MSImageStyle) {
    MSImageStyleAspect = 0, //kCAGravityResizeAspect
    MSImageStyleAspectFill = 1, //kCAGravityResizeAspectFill
};



@interface MSImageView : NSImageView

- (id)initWithFrame:(NSRect)frame
              style:(MSImageStyle)style
           andImage:(NSImage*)image;


@end
