#!/usr/bin/env perl

use 5.014;
use warnings;

open my $fh, '<', $ARGV[0] or die $!;
NUM: while (<$fh>) {
    chomp;
    my @nums = split ' ';
    shift @nums;
    @nums == 1 and do { say 'Jolly'; next };
    my %sums;
    for ( 1.. $#nums ) {
        my $z = abs($nums[$_] - $nums[$_-1]);
        $sums{$z}++;
    }

    say +(grep $sums{$_}, 1..$#nums) == (@nums-1) ? 'Jolly' : 'Not jolly';
}