//
//  NSMutableArray+Stack.m
//  prefix
//
//  Created by Shawn Campbell on 6/27/13.
//  Copyright (c) 2013 Shawn Campbell. All rights reserved.
//

#import "NSMutableArray+Stack.h"

@implementation NSMutableArray (Stack)


- (id)pop
{
    // nil if [self count] == 0
    id lastObject = [self lastObject];
    if (lastObject)
        [self removeLastObject];
    return lastObject;
}

- (void)push:(id)obj
{
    [self addObject: obj];
}

@end
