#!/usr/bin/env perl

use strict;
use warnings;

open(INFILE, "<$ARGV[0]") or die $!;

while(my $line = <INFILE>) {
    next if($line =~ m/^s$/); # skip blank lines
    chomp $line;
    my $board = createBoard($line);
    printBoard($board); 
}

close(INFILE);

sub printBoard {
    my $board = shift;
    my $rows = scalar(@$board);
    my $columns = scalar @{$$board[0]};
    for (my $i = 0; $i < $rows; $i++) {
        for (my $j = 0; $j < $columns; $j++) {
            print $$board[$i][$j] . " ";
        }

        print "\n";

    }
}

sub createBoard {
    my $line = shift;
    my ($dimensions, $board_string) = split(';', $line);
    my ($row, $column) = split(',', $dimensions);
    my @board = split('', $board_string);
    my $grid = [];
 
    # read line into a 2D array
    for (my $i = 0; $i < $row; $i++) {
        for (my $j = 0; $j < $column; $j++) {
            $$grid[$i][$j] = shift @board; # next character
        }
    }

    return $grid;
}



__END__

Challenge:
https://www.codeeval.com/browse/79/

You will be given an M*N (M = row, N = column) matrix. Each item in this matrix is either a '*' or a '.'. A '*' indicates a mine whereas a '.' does not. The objective of the challenge is to output a M*N matrix where each element contains a number (except the positions which actually contain a mine which will remain as '*') which indicates the number of mines adjacent to it. Notice that each position has at most 8 adjacent positions e.g. left, top left, top, top right, right, ...

Input sample:
3,5;**.........*...
4,4;*........*......


Output sample:
**100332001*100
*10022101*101110

