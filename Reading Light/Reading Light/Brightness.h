//
//  Brightness.h
//  Reading Light
//
//  Created by Jakob Jakobsen Boysen on 29/07/2013.
//  Copyright (c) 2013 Jakob Jakobsen Boysen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Brightness : NSObject

@property float original;
@property (nonatomic) float current;

+ (Brightness*)singleton;

@end
