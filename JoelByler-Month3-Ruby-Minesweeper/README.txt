https://www.codeeval.com/open_challenges/79/


Challenge Description:

You will be given an M*N matrix. Each item in this matrix is either a '*' or a '.'. A '*' indicates a mine whereas a '.' does not. The objective of the challenge is to output a M*N matrix where each element contains a number (except the positions which actually contain a mine which will remain as '*') which indicates the number of mines adjacent to it. Notice that each position has at most 8 adjacent positions e.g. left, top left, top, top right, right, ...

Input sample:

Your program should accept as its first argument a path to a filename. Each line in this file contains M,N, a semicolon and the M*N matrix in row major form. e.g.

3,5;**.........*...
4,4;*........*......
Output sample:

Print out the new M*N matrix (in row major form) with each position(except the ones with the mines) indicating how many adjacent mines are there. e.g.

**100332001*100
*10022101*101110
Submit your solution in a file (some file name).(py2| c| cpp| java| rb| pl| php| tcl| clj| js| scala| cs| m| py3| hs| go| bash| lua) or use the online editor.



3,5;**.........*...

**...
.....
.*...

**100332001*100



4,4;*........*......

*...
....
.*..
....

*10022101*101110
