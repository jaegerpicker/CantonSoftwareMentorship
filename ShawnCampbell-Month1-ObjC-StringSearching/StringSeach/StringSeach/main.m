//
//  main.m
//  StringSeach
//
//  Created by Shawn Campbell on 06/01/13.
//  Copyright (c) 2013 Code Art Games. All rights reserved.
//

#import <Foundation/Foundation.h>

NSMutableArray * get_char_arr(NSString *s) {
    NSMutableArray *arr = [NSMutableArray array];
    for(int x = 0; x < [s length]; x++) {
        NSString *ch = [s substringWithRange:NSMakeRange(x, 1)];
        [arr addObject:ch];
    }
    return arr;
}

bool contains_wildcard(NSString *s) {
    NSMutableArray *sa = get_char_arr(s);
    for(int j = 0; j < [sa count]; j++) {
        if([sa[j] rangeOfString:@"*"].location != NSNotFound) {
            return TRUE;
        }
    }
    return FALSE;
}

bool is_only_wildcards(NSString *s) {
    NSMutableArray *sa = get_char_arr(s);
    for(int ii = 0; ii < [sa count]; ii++) {
        if([sa[ii] rangeOfString:@"*"].location == NSNotFound) {
            return FALSE;
        }
    }
    return TRUE;
}

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
            //NSLog(s);
            NSArray *arr = [s componentsSeparatedByString:@","];
            NSString *strSearch = arr[0];
            NSString *searchee = arr[1];
            NSArray *chars = [[NSArray alloc] init];
            chars = [s componentsSeparatedByString:@""];
            for(int i = 0; i < [strSearch length]; i++) {
                if(!contains_wildcard(searchee) && [searchee length] > [strSearch length]) {
                    NSLog(@"false");
                    break;
                }
                NSString *searchSub = [[strSearch substringFromIndex:i] substringToIndex:[searchee length]];
                if(strSearch == searchee) {
                    NSLog(@"true");
                    break;
                }
                //NSLog(searchSub);
                //NSLog(searchee);
                if([searchSub rangeOfString:searchee].location != NSNotFound) {
                    NSLog(@"true");
                    break;
                }
                if(contains_wildcard(searchee)) {
                    NSLog(searchee);
                    if(is_only_wildcards(searchee)) {
                        NSLog(@"true");
                        break;
                    }

                }
                //NSLog(@"searchStrLength left: %i", ([strSearch length] - i));
                //NSLog(@"searcheeLength: %i", [searchee length]);
                if(([strSearch length] - i) <= [searchee length]) {
                    NSLog(@"false");
                    break;
                }
            }
        }
        // insert code here...
        //NSLog(@"Hello, World!");
        
    }

    return 0;
}
