//Benjamin Drake - .NET Visual C++

#include <iostream>
#include <sstream>

using namespace std;

bool checkForPalindrome(string);
string convertToString(int);

const int MAX = 999;
const int START = 111;

int main(){

	int result = 0;

	for(int firstNum = START; firstNum < MAX; firstNum++){

		for(int secondNum = START; secondNum <= MAX; secondNum++){

			int product = firstNum * secondNum;
			
			if (product > result){
				if (checkForPalindrome(convertToString(product))){
					result = product;
					cout << result << endl;
				}
			}
		}
	}

	cout << "Final result: " << result << endl;
	//Final result: 906609

	return 0;
}

bool checkForPalindrome(string answer){

	int beginIndex = 0;
	int tailIndex = answer.length() - 1;
	bool isPalindrome = true;

	while(beginIndex < tailIndex){

		if(answer[beginIndex] != answer[tailIndex]){
			isPalindrome = false;
			break;
		}

		beginIndex++;
		tailIndex--;
	}

	return isPalindrome;
}

string convertToString(int answer){

	ostringstream moveIntToString;

	moveIntToString << answer;

	return moveIntToString.str();
}