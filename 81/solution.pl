#!/usr/bin/env perl -ln

use 5.014;
use warnings;

my @nums = split /,/;

my $sums = 0;
for my $n1 ( 0 .. $#nums ) {
    for my $n2 ( $n1+1 .. $#nums ) {
        for my $n3 ( $n2+1 .. $#nums ) {
            for my $n4 ( $n3+1 .. $#nums ) {
                $sums++
                unless $nums[$n1] + $nums[$n2] + $nums[$n3] + $nums[$n4];
            }
        }
    }
}

print $sums;