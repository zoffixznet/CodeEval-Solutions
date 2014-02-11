#!/usr/bin/env perl

use 5.014;
use warnings;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp;
    my ( $x, $y, $bits ) = split /;/;
    my @bits = split ' ', $bits;
    my ( @matrix, @row );
    while ( @bits ) {
        push @row, shift @bits;
        @row < $x and next;
        push @matrix, [ @row ];
        @row = ();
    }

    # matrix is setup; print it out now;
    my ( $posx, $posy ) = ( 0, 0 );
}