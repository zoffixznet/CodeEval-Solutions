#!/usr/bin/env perl -ln

use 5.014;
use warnings;

my @points = map [/\d+/g], split /,\s/;
my $is_square = 1;
for my $p ( @points ) {
    next if grep($_->[0] == $p->[0], @points)
        and grep($_->[1] == $p->[1], @points);
    $is_square = 0;
    last;
}

print $is_square ? 'true' : 'false';

