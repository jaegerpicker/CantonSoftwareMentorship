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
#include "main.h"

char * convert_num_to_roman(char *line, const char** numerals, int* values)
{
    int number = atoi(line);
    char * res = malloc(20);
    for(int i = 0; i < 13; i++) {
        while(number > values[i]) {
            //res = malloc(strlen(res)+strlen(numerals[i])+1);
            number -= values[i];
            strcat(res, numerals[i]);
        }
    }
    return res;
}

/*void generate_lookuptab() {
    for(int i = 0; i <= 3999; i++) {
        tab[i] = {i, convert_num_to_roman(itoa(i), numerals, values)};
    }
}*/

int main(int argc, const char * argv[])
{

    clock_t start = clock() / (CLOCKS_PER_SEC / 1000);
    FILE * fp;
    char * line = NULL;
    size_t len = 0;
    ssize_t read;
    int path = 0;
    fp = fopen(argv[1], "r");
    if(argc > 2) {
        const char * compC = "c";
        const char * compL = "l";
        if(strncmp(argv[2], compC, sizeof(*argv[2])) == 0) { //straight calc
            path = 0;
        } else if(strncmp(argv[2], compL, sizeof(*argv[2])) == 0) { //lookup list
            path = 1;
        }
    }
    //generate_lookuptab();
    if(fp == NULL) {
        exit(EXIT_FAILURE);
    }
    int count = 0;
    while((read = getline(&line, &len, fp)) != -1) {
        char *res = NULL;
        if(path == 0) {
            res = convert_num_to_roman(line, numerals, values);
        } else if(path == 1) {
            res = tab[atoi(line)].roman;
            //printf("%i %s\n %")
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

