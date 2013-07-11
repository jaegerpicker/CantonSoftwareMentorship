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
@synthesize ouput;

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

-(NSArray*)findNeighbors:(NSInteger)x yCoord:(NSInteger)y
{
    NSMutableArray* ret = [[NSMutableArray alloc] init];
    MineSweeperElement *el = [self getElement:x yCoord:y];
    for(int i = -1; i <= 1; i++) {
        for(int j = -1; j <= 1; j++) {
            if((el.x + i) == x && (el.y + j) == y) {
            } else {
                MineSweeperElement* nei = [self getElement:(el.x + i) yCoord:(el.y + j)];
                if(nei != nil) {
                    [ret addObject:nei];
                }
            }
        }
    }
    NSArray* ret1 = (NSArray*)ret;
    return ret1;
}

-(MineSweeperElement*)getElement:(NSInteger)x yCoord:(NSInteger)y
{
    NSString *key = [NSString stringWithFormat:@"%ld,%ld", (long)x, (long)y];
    MineSweeperElement *val = self.elements[key];
    return val;
}

-(NSString*)solve {
    NSMutableString* ret = [[NSMutableString alloc] init];
    NSArray* keys = [self.elements allKeys];
    NSArray* sortedKeys = [keys sortedArrayUsingComparator:^NSComparisonResult(NSString* a, NSString* b) {
        return [a compare:b];
    }];
    for(id key in sortedKeys) {
        MineSweeperElement* el = [self.elements objectForKey:key];
        NSInteger elBombs = 0;
        NSString* elVal = el.value;
        if([elVal isEqual:@"*"]){
            [ret appendString:el.value];
        } else {
            NSArray* neighbors = [self findNeighbors:el.x yCoord:el.y];
            for(MineSweeperElement* n in neighbors) {
                NSString* nVal = n.value;
                if([nVal isEqual:@"*"]) {
                    elBombs++;
                }
            }
            [ret appendString:[NSString stringWithFormat:@"%ld", elBombs]];
        }
    }
    self.ouput = (NSString*)ret;
    return self.ouput;
}

@end
