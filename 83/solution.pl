#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp;
    $_ = lc;
    s/[^a-z]//g;

    my %letters;
    $letters{$_}++ for split //;

    my ( $sum, $beauty ) = ( 0, 26 );

    $sum += $_*$beauty--
        for (sort { $b <=> $a } values %letters)[0..25];

    say $sum;
}