#!/usr/bin/env perl -ln

use 5.014;
use warnings;

# We'll just reappropriate #46

my ( $start, $limit ) = split /,/;
my @primes = 2 .. $limit;

my $p = 2;
while ( $p**2 <= $limit ) {
    my ($p_i) = grep defined $primes[$_] && $primes[$_] == $p, 0..$#primes;

    for ( my $i = $p_i + $p; $i < @primes; $i += $p ) {
        delete $primes[$i];
    }
    $p = $primes[ (grep defined $primes[$_], $p_i+1 .. $#primes)[0] ]
        // last;
}

print scalar grep defined && $_>=$start, @primes;