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
    if (myfile.is_open()) {
        while (myfile.good()) {
            getline(myfile, line);
            cout << line << endl;
        }
        myfile.close();
    }
    else
    {
        cout << "Unable to open file\n";
    }
    
    return 0;
}

