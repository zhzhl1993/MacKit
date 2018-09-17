//
//  MSQueueUtil.m
//  kyExpress_Internal
//
//  Created by MelissaShu on 17/8/8.
//  Copyright © 2017年 kyExpress. All rights reserved.
//

#import "MSQueueUtil.h"

@implementation MSQueueUtil

static MSQueueUtil *_instance = nil;

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
    
    return _instance;
}



- (void)asyncRunInMainThread:(dispatch_block_t)block
{
    dispatch_async(dispatch_get_main_queue(), ^{
        block();
    });
}


- (void)asyncRunInGlobalQueue:(dispatch_block_t)block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        block();
    });
}

@end
