#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp;
    my ( $n, $m ) = split /,/;
    say $n - $m * int($n/$m);
}