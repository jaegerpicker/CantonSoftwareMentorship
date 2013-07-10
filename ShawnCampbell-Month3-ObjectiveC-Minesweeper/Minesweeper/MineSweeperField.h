//
//  MineSweeperField.h
//  Minesweeper
//
//  Created by Shawn Campbell on 7/9/13.
//  Copyright (c) 2013 Shawn Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MineSweeperField : NSObject
@property NSInteger height;
@property NSInteger width;
@property NSInteger numberOfMines;
@property NSMutableArray *field;
@property NSString *ouput;

-(NSArray*)findNeighbors;
-(NSString*)getElement;
-(NSString*)solve;

@end
