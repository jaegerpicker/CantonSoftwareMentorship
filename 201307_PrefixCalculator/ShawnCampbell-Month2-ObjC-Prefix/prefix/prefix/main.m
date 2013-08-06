//
//  main.m
//  prefix
//
//  Created by Shawn Campbell on 6/6/13.
//  Copyright (c) 2013 Shawn Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableArray+Stack.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSArray *arguements = [[NSProcessInfo processInfo] arguments];
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
            NSArray *parts = [[NSArray alloc] init];
            parts = [s componentsSeparatedByString:@" "];
            double total_value = 0.0;
            NSMutableArray *val = [[NSMutableArray alloc] init];
            NSString *op = @"";
            for(NSInteger i = [parts count]; i > 0; i--) {
                NSString *cur = parts[i - 1];
                NSScanner *sc = [NSScanner scannerWithString:cur];
                double d;
                BOOL isDouble = [sc scanDouble:&d];
                if(isDouble) {
                    [val push:[NSNumber numberWithDouble: d]];
                } else if([cur isEqualToString:@" "]) {
                    continue;
                } else {
                    op = cur;
                    id idVar; 
                    double val1 = 0.0;
                    if([val count] > 0) {
                        idVar = [val pop];
                        while(idVar != Nil) {
                            val1 = [idVar doubleValue];
                            if([op isEqualToString:@"*"]) {
                                total_value = val1 * total_value;
                            } else if([op isEqualToString:@"+"]) {
                                total_value += val1;
                            } else if([op isEqualToString:@"-"]) {
                                total_value -= val1;
                            } else {
                                total_value = total_value / val1;
                            }
                            idVar = [val pop];
                        }
                    }
                    
                }
            }
            NSLog(@"%@", total_value);
            NSLog(@"%@", s);
        }
        
    }
    return 0;
}

