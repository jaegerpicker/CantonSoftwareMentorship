//
//  main.cpp
//  RomanNumerals
//
//  Created by Shawn Campbell on 8/13/13.
//  Copyright (c) 2013 Shawn Campbell. All rights reserved.
//

#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main(int argc, const char * argv[])
{
    string line;
    ifstream myfile (argv[1]);
    int nums [13] = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 };
    string numerals [13] = {"M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"};
    string results = "";
    if (myfile.is_open()) {
        while (myfile.good()) {
            getline(myfile, line);
            int number = atoi(line.c_str());
            results = "";
            for(int i = 0; i < 13; i++) {
                while (number >= nums[i]) {
                    number -= nums[i];
                    results += numerals[i];
                }
            }
            cout << results << endl;
        }
        myfile.close();
    }
    else
    {
        cout << "Unable to open file\n";
    }
    
    return 0;
}

