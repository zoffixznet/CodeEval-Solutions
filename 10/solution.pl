#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

while ( <$fh> ) {
    my @bits = split;
    my $m = pop @bits;
    $m > @bits and next;
    say $bits["-$m"];
}

