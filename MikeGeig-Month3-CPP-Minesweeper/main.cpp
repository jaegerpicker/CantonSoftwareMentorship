#include<iostream>
#include<fstream>
#include<string>
using namespace std;

int main(int argc, char* argv[])
{
	//load file
	ifstream myfile (argv[1]);
	char fileInfo[1000];
	int infoCount = 0;

	if (myfile.is_open())
	{
		while(myfile >> fileInfo[infoCount++]);

		myfile.close();
	}

	int gridsize;
	char* field;

	//get grid
	int r = fileInfo[0] - 48;
	int c = fileInfo[2] - 48;

	gridsize = r * c;
	field = new char[gridsize];

	for(int i = 0; i < gridsize; i++)
		field[i] = fileInfo[i + 4];


	//search grid
	string output = "";
	for(int i = 0; i < gridsize; i++)
	{
		int adjacentMines = 0;

		if(field[i] == '*'){
			output += "*";
			continue;
		}

		int x = i % c;
		int y = i / c;

		for (int x2 = -1; x2 <= 1; x2++) {
			for (int y2 = -1; y2 <= 1; y2++) {

				if (x2 == 0 && y2 == 0) continue;
				if (x + x2 < 0)			continue;
				if (y + y2 < 0)			continue;
				if (x + x2 >= c)		continue;
				if (y + y2 >= r)		continue;

				if (field[c * (y + y2) + (x + x2)] == '*')
					adjacentMines++;
			}
		}

		output += adjacentMines + 48;
	}
	std::cout << output << endl;

	delete [] field;
	return 0;
}