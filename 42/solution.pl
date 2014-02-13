#!/usr/bin/env perl

use 5.014;
use warnings;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp;
    say scalar grep {
        $_ == 0 or $_ % 2 == 0 or $_ % 3 == 0 or $_ % 5 == 0 or $_ % 7 == 0
    } grep defined, map eval, map s/[^0-9]\K0+(?=[1-9])//gr,
        glob join '{+,-,}', split //;
}