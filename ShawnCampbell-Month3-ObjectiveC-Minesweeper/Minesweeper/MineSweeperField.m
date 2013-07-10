//
//  MineSweeperField.m
//  Minesweeper
//
//  Created by Shawn Campbell on 7/9/13.
//  Copyright (c) 2013 Shawn Campbell. All rights reserved.
//

#import "MineSweeperField.h"

@implementation MineSweeperField
@synthesize field;
@synthesize height;
@synthesize width;
@synthesize numberOfMines;

-(id)init:(NSMutableArray*)matrix
{
    self = [super init];
    self.field = matrix;
    return self;
}

-(NSArray*)findNeighbors
{
    NSArray* ret;
    return ret;
}

@end
