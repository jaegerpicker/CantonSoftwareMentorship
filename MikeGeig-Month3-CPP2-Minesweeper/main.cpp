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

		if (field[i - c - 1] == '*')
			adjacentMines++;
		if (field[i - c] == '*')
			adjacentMines++;
		if (field[i - c + 1] == '*')
			adjacentMines++;
		if (field[i - 1] == '*')
			adjacentMines++;
		if (field[i + 1] == '*')
			adjacentMines++;
		if (field[i + c - 1] == '*')
			adjacentMines++;
		if (field[i + c] == '*')
			adjacentMines++;
		if (field[i + c + 1] == '*')
			adjacentMines++;

		output += adjacentMines + 48;
	}
	std::cout << output << endl;

	delete [] field;
	return 0;
}