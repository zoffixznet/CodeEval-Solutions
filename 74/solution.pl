#!/usr/bin/env perl -ln

use 5.014;
use warnings;

my $coin_count;
my $num = $_;
for my $coin ( 5, 3, 1 ) {
    while ( $num >= $coin ) {
        $coin_count++;
        $num -= $coin;
    }
}
print $coin_count;