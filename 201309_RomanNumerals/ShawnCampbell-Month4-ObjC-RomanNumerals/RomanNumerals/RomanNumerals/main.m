//
//  main.m
//  RomanNumerals
//
//  Created by Shawn Campbell on 8/13/13.
//  Copyright (c) 2013 Shawn Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSDate *start = [NSDate date];
        FILE * fp;
        char * line = NULL;
        size_t len = 0;
        ssize_t read;
        NSArray * values = @[@1000, @900, @500, @400, @100, @90, @50, @40, @10, @9, @5, @4, @1];
        NSArray * numerals = @[@"M", @"CM", @"D", @"CD", @"C", @"XC", @"L", @"XL", @"X", @"IX", @"V", @"IV", @"I"];
        NSMutableString * results  = [[NSMutableString alloc] init];
        [results appendString:@""];
        //NSArray *arguements = [[NSProcessInfo processInfo] arguments];
        //NSString* file_path = [[NSString alloc] initWithCString:argv[1] encoding:NSStringEncodingConversionAllowLossy];
        //NSStringEncoding usedEncoding = 0;
        //NSError *err = nil;
        //NSString* fh = [NSString stringWithContentsOfFile:arguements[1] usedEncoding:&usedEncoding error:&err];
        //NSArray * lines = [[NSArray alloc] init];
        //lines = [fh componentsSeparatedByString:@"\n"];
        fp = fopen(argv[1], "r");
        if(fp == NULL) {
            NSLog(@"File open failed");
            exit(EXIT_FAILURE);
        }
        int line_num = 0;
        while((read = getline(&line, &len, fp)) != -1) {
            int number = atoi(line);
            for(int i = 0; i < 13; i++) {
                while (number >= [values[i] intValue]) {
                    number -= [values[i] intValue];
                    [results appendString:numerals[i]];
                }
            }
            printf("%i: %s\n", line_num, [results cString]);
            [results setString:@""];
            line_num++;
        }
        //[fh enumerateLinesUsingBlock:^(NSString * line, BOOL * stop) {
            //NSLog(@"read line: %@", line);
            
        //}];
        NSDate* end = [NSDate date];
        NSTimeInterval exTime = [end timeIntervalSinceDate:start];
        NSLog(@"It took me: %f", exTime * 1000);
    }
    return 0;
}

