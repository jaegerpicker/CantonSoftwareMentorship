//
//  main.c
//  RomanNumerals
//
//  Created by Shawn Campbell on 8/14/13.
//  Copyright (c) 2013 Shawn Campbell. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>


int main(int argc, const char * argv[])
{

    clock_t start = clock() / (CLOCKS_PER_SEC / 1000);
    FILE * fp;
    char * line = NULL;
    size_t len = 0;
    ssize_t read;
    fp = fopen(argv[1], "r");
    int values[13] = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};
    const char *numerals[13];
    numerals[0] = "M";
    numerals[1] = "CM";
    numerals[2] = "D";
    numerals[3] = "CD";
    numerals[4] = "C";
    numerals[5] = "XC";
    numerals[6] = "L";
    numerals[7] = "XL";
    numerals[8] = "X";
    numerals[9] = "IX";
    numerals[10] = "V";
    numerals[11] = "IV";
    numerals[12] = "I";
    if(fp == NULL) {
        exit(EXIT_FAILURE);
    }
    int count = 0;
    while((read = getline(&line, &len, fp)) != -1) {
        int number = atoi(line);
        char * res = malloc(20);
        for(int i = 0; i < 13; i++) {
            while(number > values[i]) {
                //res = malloc(strlen(res)+strlen(numerals[i])+1);
                number -= values[i];
                strcat(res, numerals[i]);
            }
        }
        printf("%i %s\n", count, res);
        count++;
    }
    if(line) {
        free(line);
    }
    clock_t end = clock() / (CLOCKS_PER_SEC / 1000);
    printf("It took me: %lu milliseconds\n", (end - start));
    return 0;
}

