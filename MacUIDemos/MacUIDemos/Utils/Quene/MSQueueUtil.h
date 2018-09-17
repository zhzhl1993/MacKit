//
//  MSQueueUtil.h
//  kyExpress_Internal
//
//  Created by MelissaShu on 17/8/8.
//  Copyright © 2017年 kyExpress. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSQueueUtil : NSObject
+ (instancetype)shareInstance;


- (void)asyncRunInGlobalQueue:(dispatch_block_t)block;
- (void)asyncRunInMainThread:(dispatch_block_t)block;

@end
