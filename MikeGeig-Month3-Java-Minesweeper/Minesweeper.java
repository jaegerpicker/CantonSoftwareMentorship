import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Minesweeper {
	public static void main(String[] args) {
		
		int r = 0, c = 0;
		char []fields = {0};
		int gridsize = 0;
		String output = "";
		
		//get grid
		try {
			
			File file = new File(args[0]);
			Scanner input = new Scanner(file);
			
			r = input.findInLine(".").charAt(0) - 48;
			input.findInLine(".").charAt(0);
			c = input.findInLine(".").charAt(0) - 48;
			input.findInLine(".").charAt(0);
			
			gridsize = r * c;
			fields = new char[gridsize];
			for(int i = 0; i < gridsize; i++)
				fields[i] = input.findInLine(".").charAt(0);
			
			input.close();
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for(int i = 0; i < gridsize; i++)
		{
			int adjacentMines = 0;
			
			if(fields[i] == '*'){
				output += fields[i];
				continue;
			}
			
			int x = i % c;
			int y = i / c;
			
			for(int x2 = -1; x2 <= 1; x2++)
				for(int y2 = -1; y2 <= 1; y2++)
				{
					if(x2 == 0 && y2 == 0)	continue;
					if(x + x2 < 0)			continue;
					if(y + y2 < 0)			continue;
					if(x + x2 >= c)			continue;
					if(y + y2 >= r)			continue;
					
					if(fields[c * (y + y2) + (x + x2)] == '*')
						adjacentMines++;
				}
			
			output += adjacentMines;
		}
		
		System.out.print(output);
	}
}
