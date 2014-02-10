#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    my @digits = /\d+/g;

    my $count = 1;
    my @str;
    for ( 0 .. $#digits ) {
        if ( $_ == $#digits or $digits[$_] != $digits[$_+1] ) {
            push @str, "$count $digits[$_]";
            $count = 1;
            next;
        }
        $count++;
    }
    say "@str";
}