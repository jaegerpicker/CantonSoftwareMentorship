//
//  MineSweeperElement.h
//  Minesweeper
//
//  Created by Shawn Campbell on 7/9/13.
//  Copyright (c) 2013 Shawn Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MineSweeperElement : NSObject
@property int x;
@property int y;
@property int type;
@property NSString* value;

@end
