//
//  Minesweeper_Tests.m
//  Minesweeper Tests
//
//  Created by Shawn Campbell on 7/3/13.
//  Copyright (c) 2013 Shawn Campbell. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MineSweeperMatrixParser.h"
#import "MineSweeperField.h"

@interface Minesweeper_Tests : XCTestCase
@property MineSweeperMatrixParser* msmp;
@property MineSweeperField* msf;
@end

@implementation Minesweeper_Tests

- (void)setUp
{
    [super setUp];
    _msmp = [[MineSweeperMatrixParser alloc] init];
    _msf = [[MineSweeperField alloc] init];
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
    XCTAssertTrue(ret, @"parseInput returned false");
}

- (void)testMineSweeperParserParseInputStringMatrixValid
{
    NSString * line = @"3,5;**.........*...";
    BOOL ret = [_msmp parseInput:line];
    XCTAssertTrue(ret, @"parseInput returned false");
    NSUInteger arrCount = [_msmp.matrix count];
    XCTAssertTrue(arrCount == 3, @"arrCount does not have 3 elements %lu", (unsigned long)arrCount);
}

-(void)testMineSweeperParserParseInputStringMatrixElementsValid
{
    NSString * line = @"3,5;**.........*...";
    BOOL ret = [_msmp parseInput:line];
    XCTAssertTrue(ret, @"parseInput returned false");
    NSUInteger arrCount = [_msmp.matrix count];
    for(int i = 0; i < arrCount; i++) {
        XCTAssertTrue([_msmp.matrix[i] length] == 5, @"element %@ has length %lu not 5", _msmp.matrix[i], (unsigned long)[_msmp.matrix[i] length]);
    }
}

- (void)testMineSweeperParserMatrix
{
    XCTAssertNotNil(_msmp.matrix, @"msmp matrix is nil");
}

- (void)testMindSweeperMineField
{
    XCTAssertNotNil(_msf, @"The Mine Sweeper Field is nil");
}

- (void)testMineSweeperMineFieldfindNeighbors
{
    NSArray* ret = [_msf findNeighbors];
    XCTAssertNotNil(ret, @"Find neighbors returned nil");
    
}

@end
