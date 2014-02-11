#!/usr/bin/env perl

use 5.014;
use warnings;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp; length or next;
    my ( $one, $two ) = split /;/;
    my @one = split //, $one;
    my @two = split //, $two;

    my @sub;
    for my $i1 ( 0 .. $#one ) {

        for my $i2 ( 0 .. $#two ) {
            if ( $two[$i2] eq $one[$i1] ) {
                push @sub, $two[$i2];
                next;
            }
        }
    }
}