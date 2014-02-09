#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp;
    my ( $x, $n ) = split /,/;
    my $i = 0;
    my $nn;
    $nn = $n * $i++ while $nn < $x;
    say $nn;
}