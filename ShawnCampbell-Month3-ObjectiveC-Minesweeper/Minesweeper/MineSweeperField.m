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
    self.elements = [[NSMutableDictionary alloc] init];
    self.width = [self.field count];
    self.height = [self.field[1] length];
    for(int i = 0; i < [self.field count]; i++) {
        NSString * row = (NSString*)self.field[i];
        for(int j = 0; j < [row length]; j++) {
            MineSweeperElement *el = [[MineSweeperElement alloc] init];
            el.x = i;
            el.y = j;
            NSRange rg;
            rg.location = j;
            rg.length = 1;
            NSString* c = [row substringWithRange:rg];
            el.value = c;
            if([c  isEqual: @"*"]) {
                el.type = 1;
                numberOfMines++;
            } else {
                el.type = 2;
            }
            NSString * key = [NSString stringWithFormat:@"%d,%d", i, j];
            [self.elements setObject:el forKey:key];
        }
    }
    return self;
}

-(NSArray*)findNeighbors
{
    NSArray* ret = [[NSArray alloc] init];
    return ret;
}

@end
