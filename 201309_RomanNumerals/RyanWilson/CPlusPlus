//Ryan Wilson
//August 6, 2013

#include <iostream>
#include <fstream>
#include <string>
#include <ctype.h>
#include <cstdlib>
#include <array>
using namespace std;

string ConvertInteger(int &number);
int ConvertRoman(string &s);

int main()
{
  int temp = 0;
	bool done = false;
	string tempString;
	fstream myStream ("myFile2.txt");
	char a = NULL;

	if(myStream.is_open())
	{
		while(!myStream.eof())
		{
		  myStream.get(a);
			if(myStream.peek() != myStream.eof())
			{
				if(a == ' ')
				{
					temp = std::stoi(tempString);
					cout << "The integer converted to Roman Numeral is: " << ConvertInteger(temp) << "\n";
					tempString = ConvertInteger(temp);
					cout << "The Roman Numeral converted to Integer is: " << ConvertRoman(tempString) << "\n";
					tempString = "";

				}
				else
				{
					tempString = tempString + a;
				}
			}
		}	
	}
	myStream.close();
	
	tempString = "";
	temp = 0;
	int myArray[20];
	

	for(int i = 0; i < 20; i++)
	{
		myArray[i] = (rand() % 4999) + 1;
		tempString = ConvertInteger(myArray[i]);
		cout << "The random number converted to Roman Numeral is: " << ConvertInteger(myArray[i]) << "\n";
		cout << "The random Roman Numeral converted to Integer is: " << ConvertRoman(tempString) << "\n";
	}

	tempString = "";
	temp = 0;

		while(!done)
		{
			cout << "Please enter a number from 0-4999: ";
			cin >> temp;
			
				if((temp < 0) || (temp > 4999))
				{
					cout << "\n" << "Invalid Number" << "\n";
				}
				else
				{
					done = true;
				}

		}

			tempString = ConvertInteger(temp);
			cout << "The number as a Roman numeral is: " << tempString << "\n";
			cout << "The number converted back from a Roman numeral is: " << ConvertRoman(tempString);
			
		
		cin >> temp;

	return 0;
}

string ConvertInteger(int &number)
{
	string myString;
	int temp = 0;
	
	if(number == 0)
	{
		myString = "Undefined";
	}

	temp = number / 1000;
		if(temp == 1)
		{
			myString = myString + "M";
		}
		else if(temp == 2)
		{
			myString = myString + "MM";
		}
		else if(temp == 3)
		{
			myString = myString + "MMM";
		}
		else if(temp == 4)
		{
			myString = myString + "iV";
		}
	
	temp = (number % 1000) / 100;

		if(temp == 1)
		{
			myString = myString + "C";
		}
		else if(temp == 2)
		{
			myString = myString + "CC";
		}
		else if(temp == 3)
		{
			myString = myString + "CCC";
		}
		else if(temp == 4)
		{
			myString = myString + "CD";
		}
		else if(temp == 5)
		{
			myString = myString + "D";
		}
		else if(temp == 6)
		{
			myString = myString + "DC";
		}
		else if(temp == 7)
		{
			myString = myString + "DCC";
		}
		else if(temp == 8)
		{
			myString = myString + "DCCC";
		}
		else if(temp == 9)
		{
			myString = myString + "CM";
		}

	temp = ((number % 1000) % 100) / 10;
		
		if(temp == 1)
		{
			myString = myString + "X";
		}
		else if(temp == 2)
		{
			myString = myString + "XX";
		}
		else if(temp == 3)
		{
			myString = myString + "XXX";
		}
		else if(temp== 4)
		{
			myString = myString + "XL";
		}
		else if(temp == 5)
		{
			myString = myString + "L";
		}
		else if(temp == 6)
		{
			myString = myString + "LX";
		}
		else if(temp == 7)
		{
			myString = myString + "LXX";
		}
		else if(temp == 8)
		{
			myString = myString + "LXXX";
		}
		else if(temp == 9)
		{
			myString = myString + "XC";
		}

	temp = (((number % 1000) % 100) % 10) / 1;

		if(temp == 1)
		{
			myString = myString + "I";
		}
		else if(temp == 2)
		{
			myString = myString + "II";
		}
		else if(temp == 3)
		{
			myString = myString + "III";
		}
		else if(temp == 4)
		{
			myString = myString + "IV";
		}
		else if(temp == 5)
		{
			myString = myString + "V";
		}
		else if(temp == 6)
		{
			myString = myString + "VI";
		}
		else if(temp == 7)
		{
			myString = myString + "VII";
		}
		else if(temp == 8)
		{
			myString = myString + "VIII";
		}
		else if(temp == 9)
		{
			myString = myString + "IX";
		}

	return myString;
}

int ConvertRoman(string &s)
{
	int myInt = 0;
	int temp = 0;
	temp = s.length();
	char a = NULL;
	
	
 if(s != "Undefined")
 {
	
	for(int i = 0; i < temp; i++)
	{
		
		a = s[i];
		
		if(a == 'i') 
		{
			if(i + 1 < temp)
			{
				a = s[i +1];
			}
			if(a == 'V')
			{
				myInt = myInt + 4000;
				i++;
			}
		}
		else if(a == 'M')
		{
			myInt = myInt + 1000;
			
		}
		else if(a == 'D')
		{
			myInt = myInt + 500;
		}
		else if(a == 'C') 
		{
			if(i + 1 < temp) 
			{
				a = s[i +1];
			
				if(a == 'M')
				{
					myInt = myInt + 900;
					i++;
				}
				else if(a == 'D')
				{
					myInt = myInt + 400;
					i++;
				}
				else if(a == 'C')
				{
					myInt = myInt + 200;
					i++;
				}
				else 
				{
					myInt = myInt + 100;
				}
			}
			else 
			{
				myInt = myInt + 100;
			}

		}
		else if(a == 'L')
		{
			myInt = myInt + 50;
		}
		
		else if(a == 'X') 
		{
			if(i + 1 < temp)
			{
				a = s[i +1];
			
				if(a == 'C')
				{
					myInt = myInt + 90;
					i++;
				}
				else if(a == 'L')
				{
					myInt = myInt + 40;
					i++;
				}
				else if(a == 'X')
				{
					myInt = myInt + 20;
					i++;
				}
				else
				{
					myInt = myInt + 10;
				}
			}
			else
			{
				myInt = myInt + 10;
			}

			
		}
		else if(a == 'V')
		{
			myInt = myInt + 5;
		}
		else if(a == 'I')
		{
			if(i + 1 < temp)
			{
				a = s[i +1];
			

				if(a == 'X')
				{
					myInt = myInt + 9;
					i++;
				}
				else if(a == 'V')
				{
					myInt = myInt + 4;
					i++;
				}
				else if(a == 'I')
				{
					myInt = myInt + 2;
					i++;
				}
			}
			else
			{
				myInt = myInt + 1;
			}
		}
		
	}
 }

	return myInt;
}
