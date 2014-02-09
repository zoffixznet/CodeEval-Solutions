#!/usr/bin/env perl

use 5.014;

for my $y ( 1 .. 12 ) {
    for my $x ( 1 .. 12 ) {
        print sprintf $x == 1 ? '%s' : '%4s', $x*$y;
    }
    print "\n";
}
