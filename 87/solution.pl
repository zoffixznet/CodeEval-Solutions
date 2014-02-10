#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

my @board = map [ (0) x 255 ], 0..255;

while (<$fh>) {
    chomp;
    my ( $action, $what, $location, $num )
    = /(Set|Query)(Row|Col)\s+(\d+)(?:\s+(\d+))?/;

    my $sum;
    for my $col ( $what eq 'Col' ? $location : (0..255) ) {
        for my $row ( $what eq 'Row' ? $location : (0..255) ) {
            if ( $action eq 'Set' ) {
                $board[$row][$col] = $num;
            } else {
                $sum += $board[$row][$col];
            }
        }
    }

    say $sum if $action eq 'Query';
}