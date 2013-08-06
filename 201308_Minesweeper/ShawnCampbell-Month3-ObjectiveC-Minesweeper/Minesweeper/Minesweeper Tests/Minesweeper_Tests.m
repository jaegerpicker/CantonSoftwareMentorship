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
    NSString* line = @"3,5;**.........*...";
    BOOL ret = [_msmp parseInput:line];
    if(ret){
        _msf = [[MineSweeperField alloc] init:_msmp.matrix];
    }
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
    NSArray* ret = [_msf findNeighbors:1 yCoord:2];
    XCTAssertNotNil(ret, @"Find neighbors returned nil");
    NSLog(@"%@", ret);
    XCTAssertTrue([ret count] == 8, @"ret count equals %ld", [ret count]);
}

- (void)testMineSweeperMineFieldgetElement
{
    MineSweeperElement* el = _msf.elements[@"1,2"];
    MineSweeperElement* testEl = [_msf getElement:1 yCoord:2];
    XCTAssertTrue(el == testEl, @"The Mine Sweeper elements test differently");
}

- (void)testMineSweeperMineFieldElementsNotNil
{
    XCTAssertNotNil(_msf.elements, @"Elements was nil");
}

- (void)testMineSweeperMineFieldElementsCount
{
    NSInteger totNumElements = _msf.width * _msf.height;
    XCTAssertTrue([_msf.elements count] == totNumElements, @"Elements count did not equal the total number of elements %lu %ld", (unsigned long)[_msf.elements count], (long)totNumElements);
}

- (void)testMineSweeperMineFieldSolve
{
    NSString* solution = @"**100332001*100";
    NSString* output = [_msf solve];
    XCTAssertTrue([solution isEqual:output], @"Solutions did not match %@ :%@", solution, output);
}

- (void)testMineSweeperMineFieldSolve2ndExample
{
    MineSweeperMatrixParser *m = [[MineSweeperMatrixParser alloc] init];
    NSString* line = @"4,4;*........*......";
    BOOL ret = [m parseInput:line];
    XCTAssertTrue(ret, @"m parseInput failed");
    MineSweeperField* f = [[MineSweeperField alloc] init:m.matrix];
    NSString* solution = @"*10022101*101110";
    NSString* output = [f solve];
    XCTAssertTrue([solution isEqual:output], @"Solution and output differ %@:%@", solution, output);
}

@end
