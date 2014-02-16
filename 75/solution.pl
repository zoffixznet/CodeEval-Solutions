#!/usr/bin/env perl -ln

use 5.014;
use warnings;

my ( $n, $m ) = /\d+/g;
my @people = 0 .. $n-1;
my @dead;
while ( @people ) {
    push @people, shift @people for 1 .. $m - 1;
    push @dead, shift @people;
}
print "@dead";