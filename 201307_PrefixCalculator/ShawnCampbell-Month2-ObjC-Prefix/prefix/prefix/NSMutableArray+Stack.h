//
//  NSMutableArray+Stack.h
//  prefix
//
//  Created by Shawn Campbell on 6/27/13.
//  Copyright (c) 2013 Shawn Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Stack)

- (id)pop;
- (void)push:(id)obj;

@end
