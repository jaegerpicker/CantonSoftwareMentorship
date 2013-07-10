//
//  MineSweeperField.h
//  Minesweeper
//
//  Created by Shawn Campbell on 7/9/13.
//  Copyright (c) 2013 Shawn Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MineSweeperElement.h"

@interface MineSweeperField : NSObject
@property NSInteger height;
@property NSInteger width;
@property NSInteger numberOfMines;
@property NSMutableArray *field;
@property NSString *ouput;
@property NSMutableDictionary *elements;
-(id)init:(NSMutableArray*)matrix;
-(NSArray*)findNeighbors;
-(NSString*)getElement;
-(NSString*)solve;

@end
