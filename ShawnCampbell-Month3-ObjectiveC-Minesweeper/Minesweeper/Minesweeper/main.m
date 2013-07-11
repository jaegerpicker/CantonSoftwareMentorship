//
//  main.m
//  Minesweeper
//
//  Created by Shawn Campbell on 7/3/13.
//  Copyright (c) 2013 Shawn Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MineSweeperMatrixParser.h"
#import "MineSweeperField.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSArray *arguements = [[NSProcessInfo processInfo] arguments];
        //NSString *workingDir = [[[NSProcessInfo processInfo] environment] objectForKey:@"PWD"];
        //NSLog(@"working directory = %@", workingDir);
        NSStringEncoding usedEncoding = 0;
        NSError *err = nil;
        NSString *path = [[NSString alloc] initWithContentsOfFile:arguements[1] encoding:usedEncoding error:&err];
        //NSLog(@"file: %@", path);
        NSArray *lines = [[NSArray alloc] init];
        lines = [path componentsSeparatedByString:@"\n"];
        for(NSString *s in lines) {
            if([s length] == 0) {
                break;
            }
            MineSweeperMatrixParser *m = [[MineSweeperMatrixParser alloc] init];
            //NSString* line = @"4,4;*........*......";
            BOOL ret = [m parseInput:s];
            if(ret){
                MineSweeperField* f = [[MineSweeperField alloc] init:m.matrix];
                NSString* output = [f solve];
                NSLog(@"%@", output);
            }
        }
        
    }
    return 0;
}

