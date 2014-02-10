#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp;

    my @tokens    = split;
    my @operators = reverse grep m{[+*/]}, @tokens;
    my @nums      = grep !m{[+*/]}, @tokens;

    for ( @operators ) {
        my ( $num1, $num2 ) = splice @nums, 0, 2;
        unshift @nums, eval "$num1 $_ $num2";
    }
    say shift @nums;
}