#!/usr/bin/env perl

use strict;
use warnings;

my $sum   = 2; # We'll start off with the first prime added
my $count = 1;
my $num   = 2;
NUM: while ( $count < 1000 ) {
    $num++;
    $num % $_ == 0 and next NUM
        for 2 .. sqrt $num;

    # We have a prime number, if we got up to here
    $sum += $num;
    $count++;
}

print "$sum\n";