#!/usr/bin/env perl

use 5.014;
use warnings;

open my $fh, '<', $ARGV[0] or die $!;

my @triangle = map [ split ' ' ], reverse <$fh>;

for my $row ( 0 .. $#triangle - 1 ) {
    for my $col ( 0 .. $#{$triangle[$row]} - 1 ) {
        my ( $v1, $v2 ) = @{ $triangle[$row] }[$col, $col+1];
        $triangle[$row+1][$col] += $v1 >= $v2 ? $v1 : $v2;
    }
}

say $triangle[-1][0];