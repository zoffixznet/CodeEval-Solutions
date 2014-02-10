#!/usr/bin/env perl

use 5.014;
open my $fh, '<', $ARGV[0] or die $!;

while ( <$fh> ) {
    chomp;
    my @els = split /,\s*/;
    my $max = -999999;
    for my $end ( reverse 0..$#els ) {
        for my $start ( 0 .. $end ) {
            my $sum = eval join '+', @els[$start .. $end];
            next unless defined $sum and $sum > $max;
            $max = $sum;
        }
    }
    say $max;
}
