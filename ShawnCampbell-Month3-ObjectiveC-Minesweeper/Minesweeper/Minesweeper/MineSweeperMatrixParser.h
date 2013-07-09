//
//  MineSweeperMatrixParser.h
//  Minesweeper
//
//  Created by Shawn Campbell on 7/4/13.
//  Copyright (c) 2013 Shawn Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Accelerate/Accelerate.h>

@interface MineSweeperMatrixParser : NSObject
@property NSMutableArray* matrix;
- (BOOL)parseInput:NSString;
@end
