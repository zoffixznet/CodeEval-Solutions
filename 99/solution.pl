#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    my ( $x1, $y1, $x2, $y2 ) = /[-\d]+/g;
    say sqrt( ($x1-$x2)**2 + ($y1-$y2)**2 );
}