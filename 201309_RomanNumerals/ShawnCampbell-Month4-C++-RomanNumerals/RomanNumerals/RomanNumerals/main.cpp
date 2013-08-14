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
#include <ctime>
#include <chrono>
using namespace std;

int write_test_file(string file_name) {
    ofstream test_file(file_name);
    if(test_file.is_open()) {
        for(int i = 0; i < 10000000; i++) {
            test_file << rand() % 3999 + 1 << endl;
        }
        test_file.close();
    }
    return 0;
}



int main(int argc, const char * argv[])
{
    const char * file_gen = "f";
    cout << argv[2] << " " << file_gen << endl;
    if(string(argv[2]) == "f") {
        write_test_file(argv[1]);
    } else {
        auto start = std::chrono::steady_clock::now();
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
        auto end = std::chrono::steady_clock::now();
        auto elapsed = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
        cout << "It took me " << elapsed.count() << " microseconds." << endl;
    }
    return 0;
}
