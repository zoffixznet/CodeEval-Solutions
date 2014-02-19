#!/usr/bin/env perl -ln

use 5.014;
use warnings;

my @nums = /\d+/g;

my $k = pop @nums;

for ( grep $_%$k == 0, 0..$#nums ) {
    next if $_+$k-1 > $#nums;
    @nums[$_..$_+$k-1] = reverse @nums[$_..$_+$k-1];
}

print join ',', @nums;
