#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp;
    my $p = length;
    say $_ eq eval(join '+', map "$_**$p", split //)
        ? 'True' : 'False';
}