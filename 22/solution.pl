#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp;
    my @fib = ( 0, 1, 1 );
    $fib[$_] = $fib[$_-1] + $fib[$_-2]
        for 3 .. $_;

    say @fib[$_];
}