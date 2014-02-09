#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp;
    my ( $n, $p1, $p2 ) = split /,/;
    my $n = sprintf '%b', $n;
    say substr($n, 0-$p1, 1) eq substr($n, 0-$p2, 1) ? 'true' : 'false';
}