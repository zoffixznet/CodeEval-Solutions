#!/usr/bin/env perl

use strict;
use warnings;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp;
    my ( $A, $B, $N ) = split ' ';
    my @output;
    for ( 1 .. $N ) {
        push @output, $_ % $A == 0 && $_ % $B == 0
            ? 'FB' : $_ % $A == 0
                ? 'F' : $_ % $B == 0
                    ? 'B' : $_;
    }
    print "@output\n";
}