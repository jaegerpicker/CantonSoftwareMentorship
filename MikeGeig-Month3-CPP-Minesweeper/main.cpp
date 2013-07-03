#include<iostream>
#include<fstream>
using namespace std;

int main(int argc, char* argv[])
{
    ifstream myfile (argv[1]);
	int gridsize;
	char* field;
	int r, c;

	//get grid
	if (myfile.is_open())
	{
		char trash;
		myfile >> r >> trash >> c >> trash;

		gridsize = r * c;
		field = new char[gridsize];

		for(int i = 0; i < gridsize; i++)
			myfile >> field[i];

		myfile.close();
	}

	//search grid
	for(int i = 0; i < gridsize; i++)
	{
		int adjacentMines = 0;

		if(field[i] == '*'){
			cout << "*";
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

		cout << adjacentMines;
	}
	

	delete [] field;
	return 0;
}