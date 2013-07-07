#!/usr/bin/env perl

use strict;
use warnings;

open(INFILE, "<$ARGV[0]") or die $!;

while(my $line = <INFILE>) {
    next if($line =~ m/^s$/); # skip blank lines
    chomp $line;
    my $board = createBoard($line);
    solve($board);
}

close(INFILE);

sub solve {
    my $board = shift;
    my $rows = scalar(@$board);
    my $columns = scalar @{$$board[0]};

    for (my $row = 0; $row < $rows; $row++) {
        for (my $column = 0; $column < $columns; $column++) {

            # skip mines
            if ($$board[$row][$column] eq '*') {
                print "*";
                next;
            }

            my $result = inspectSquare($board, $row, $column);
            print $result;
        }
    }
    print "\n";
}

sub inspectSquare {
    my ($board, $row, $column) = @_;
    my $rows = scalar(@$board);
    my $columns = scalar @{$$board[0]};

    # create an array of coordinates to inspect
    my @coords;
   
    # push every possible coordinate on
    push(@coords, [$row - 1, $column - 1]); # top-left
    push(@coords, [$row - 1, $column]); #top
    push(@coords, [$row - 1, $column + 1]); # top-right
    push(@coords, [$row, $column + 1]); # right
    push(@coords, [$row + 1, $column + 1]); # bottom-right
    push(@coords, [$row + 1, $column]); # bottom
    push(@coords, [$row + 1, $column - 1]); # bottom-left
    push(@coords, [$row, $column - 1]); # left

    # get a count of the mines in the surrounding squares
    my $mine_count = 0;
    foreach my $coord (@coords) {
        # filter out edge cases here
        next if $$coord[0] < 0 || $$coord[0] == $rows;
        next if $$coord[1] < 0 || $$coord[1] == $columns;
        $mine_count++ if $$board[ $$coord[0] ][ $$coord[1] ] eq '*';
    }

    return $mine_count;
}

sub createBoard {
    my $line = shift;
    my ($dimensions, $board_string) = split(';', $line);
    my ($rows, $columns) = split(',', $dimensions);
    my @board = split('', $board_string);
    my $grid = [];

    # read line into a 2D array
    for (my $row = 0; $row < $rows; $row++) {
        for (my $column = 0; $column < $columns; $column++) {
            $$grid[$row][$column] = shift @board; # next character
        }
    }

    return $grid;
}

