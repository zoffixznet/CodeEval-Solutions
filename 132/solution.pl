#!/usr/bin/env perl -ln

use 5.014;
use warnings;

my @nums = /\d+/g;
my %seen;
$seen{$_}++ for @nums;
my ( $top ) = sort { $seen{$b} <=> $seen{$a} } keys %seen;

print $seen{$top} > @nums/2 ? $top : 'None';
