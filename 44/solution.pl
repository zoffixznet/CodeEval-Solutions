#!/usr/bin/env perl -ln

use 5.014;
use warnings;

chomp;
my %map = map +( $_ => 0 ), split //;
$map{$_}++ for split //;
my @digits = grep $_, keys %map;
my $num = $_;
my $orig = $_;

NUM: while ( 1 ) {
    $num++;
    my $t = $num;
    eval "\$t =~ tr/0$orig//d";
    next if length $t;

    for ( @digits ) {
        next NUM
            unless $map{$_} == eval "\$num =~ tr/$_//";
    }

    print $num;
    last;
}