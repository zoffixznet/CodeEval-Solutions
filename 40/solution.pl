#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

while ( defined(my $num = <$fh>) ) {
    chomp $num;
    my @digits = split //, $num;
    my $is_self_describing = 1;
    for ( 0 .. $#digits ) {
        my $matches = () = $num =~ /$_/g;
        $matches == $digits[$_]
            or $is_self_describing = 0;
    }
    say $is_self_describing;
}