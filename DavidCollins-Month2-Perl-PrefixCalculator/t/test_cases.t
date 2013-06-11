#!/usr/bin/env perl

use warnings;
use strict;
use Test::More qw(no_plan);

use FindBin;
# 'lib' in .gitignore :(
use lib "$FindBin::Bin/../pm";

use PrefixExpressionEvaluator;

open(TEST_CASES, "<$FindBin::Bin/cases.txt") || die $!;
my @cases = <TEST_CASES>;
close TEST_CASES;

my $pec = PrefixExpressionEvaluator->new;

foreach my $case (@cases) {
    chomp $case;
    next if $case =~ m/^#/;
    next if !$case;
    my ($expression, $result) = split(/=/, $case);
    is($result = $pec->evaluate($expression), $result, "$expression = $result");
}

