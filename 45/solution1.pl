#!/usr/bin/env perl

use 5.014;
use warnings;

open my $fh, '<', $ARGV[0] or die $!;

while ( defined(my $num = <$fh>) ) {
    chomp $num;
    my $iter = 0;
    do {
        $num = $num + reverse $num;
        $iter++;
    } while ( $num ne reverse $num );
    say "$iter $num";
}