//
//  Minesweeper_Tests.m
//  Minesweeper Tests
//
//  Created by Shawn Campbell on 7/3/13.
//  Copyright (c) 2013 Shawn Campbell. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MineSweeperMatrixParser.h"

@interface Minesweeper_Tests : XCTestCase
@property MineSweeperMatrixParser* msmp;
@end

@implementation Minesweeper_Tests

- (void)setUp
{
    [super setUp];
    _msmp = [[MineSweeperMatrixParser alloc] init];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testMineSweeper
{    
    XCTAssertNotNil(_msmp, @"msmp is nill");
}

- (void)testMineSweeperParserParseInputString
{
    NSString* line = @"3,5;**.........*...";
    BOOL ret = [_msmp parseInput:line];
    //NSLog(@"%@", ret);
    XCTAssertTrue(ret, @"parseInput returned false");
}

- (void)testMineSweeperParserMatrix
{
    
}

@end
