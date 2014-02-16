#!/usr/bin/env perl -ln

use 5.014;
use warnings;

my ( $s, $e ) = split ' ';
my @range = $s .. $e;

my $pals = 0;
for my $i ( 0 .. $#range ) {
    for my $j ( $i .. $#range ) {
        my $sub_pals = 0;
        for my $n ( @range[$i..$j] ) {
            $sub_pals++ if $n == 0 + reverse $n;
        }
        $sub_pals % 2 == 0 and $pals++;
    }
}

print $pals;