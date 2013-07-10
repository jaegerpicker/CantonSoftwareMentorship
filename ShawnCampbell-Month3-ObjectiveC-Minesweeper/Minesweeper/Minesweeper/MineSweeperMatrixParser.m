//
//  MineSweeperMatrixParser.m
//  Minesweeper
//
//  Created by Shawn Campbell on 7/4/13.
//  Copyright (c) 2013 Shawn Campbell. All rights reserved.
//

#import "MineSweeperMatrixParser.h"


@implementation MineSweeperMatrixParser
@synthesize matrix;
-(id)init
{
    self = [super init];
    matrix = [[NSMutableArray alloc] init];
    return self;
}

-(BOOL) parseInput:(NSString*)line
{
    [matrix removeAllObjects];
    NSArray* mainComponents = [line componentsSeparatedByString:@";"];
    NSArray* sizes = [mainComponents[0] componentsSeparatedByString:@","];
    for(int i = 0; i < [sizes[0] intValue]; i++) {
        NSRange downOnTheRange;
        downOnTheRange.location = (i * [sizes[1] intValue]);
        downOnTheRange.length = [sizes[1] intValue];
        [matrix addObject:[mainComponents[1] substringWithRange:downOnTheRange]];
    }
    //NSLog(@"%@", matrix);
    return TRUE;
}
@end
