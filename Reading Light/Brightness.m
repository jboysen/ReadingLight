//
//  Brightness.m
//  Reading Light
//
//  Created by Jakob Jakobsen Boysen on 29/07/2013.
//  Copyright (c) 2013 Jakob Jakobsen Boysen. All rights reserved.
//

#import "Brightness.h"

@implementation Brightness

+ (Brightness*)singleton
{
    static Brightness *singleton;
    
    @synchronized(self)
    {
        if (!singleton) {
            singleton = [[Brightness alloc] init];
        }
        return singleton;
    }
}

- (void)setCurrent:(float)current
{
    _current = current;
    [UIScreen mainScreen].brightness = current;
}

@end
