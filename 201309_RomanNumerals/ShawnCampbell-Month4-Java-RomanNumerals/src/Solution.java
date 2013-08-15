/**
 * Created with IntelliJ IDEA.
 * User: shawn
 * Date: 8/14/13
 * Time: 12:18 AM
 * To change this template use File | Settings | File Templates.
 */
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;


public class Solution {
    public static void main(String[] args) {
        try {
            long start = System.currentTimeMillis();
            int[] values = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};
            String[] numerals = {"M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"};
            BufferedReader br = new BufferedReader(new FileReader(args[0]));
            String line;
            int count = 0;
            while((line = br.readLine()) != null) {
                int number;
                String results = "";
                try {
                    number = Integer.parseInt(line);
                    for(int i = 0; i < 13; i++) {
                        while(number > values[i]) {
                            number -= values[i];
                            results += numerals[i];
                        }
                    }
                    System.out.println(count + ": " + results);
                    count++;
                } catch (NumberFormatException nfe) {
                    System.out.println(nfe.toString());
                }
            }
            long end = System.currentTimeMillis();
            long delta = end - start;
            System.out.println("It took me: " + delta + " milliseconds");
        } catch (FileNotFoundException fnfe) {
            System.out.println(fnfe.toString());
        } catch (IOException ioe) {
            System.out.println(ioe.toString());
        }

    }
}
