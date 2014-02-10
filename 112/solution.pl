#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

while ( <$fh> ) {
    chomp;
    my ( $nums, $swaps ) = split /\s*:\s*/;
    my @nums = split ' ', $nums;
    for ( split /,\s*/, $swaps ) {
        my ( $p1, $p2 ) = split /-/;
        @nums[$p1, $p2] = @nums[$p2, $p1];
    }
    say "@nums";
}
