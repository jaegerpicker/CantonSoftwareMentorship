//
//  main.m
//  prefix
//
//  Created by Shawn Campbell on 6/6/13.
//  Copyright (c) 2013 Shawn Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>

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
            
            NSLog(@"%@", s);
        }
        
    }
    return 0;
}

