#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

while ( <$fh> ) {
    chomp;
    ( $_, my $strip ) = split /,\s*/;

    s/[$strip]+//g;
    s/^\s+|\s+$//g;
    say;
}

