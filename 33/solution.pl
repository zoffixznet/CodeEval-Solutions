#!/usr/bin/env perl

use 5.014;
use warnings;

open my $fh, '<', $ARGV[0] or die $!;
<$fh>; # ignore first line.

while (<$fh>) {
    chomp;
    my $ans = 0;
    for my $i ( 0 .. $_ ) {
        for my $j ( $i .. $_ ) {
            $ans++ if $i**2 + $j**2 == $_;
        }
    }
    say $ans;
}