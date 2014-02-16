#!/usr/bin/env perl -ln

use 5.014;
use warnings;

my %chain = split /[-;]/;

my $cur = 'BEGIN';
while ( defined($cur = delete $chain{$cur}) ) {
    last if $cur eq 'END';
}

print defined $cur && ! keys %chain ? 'GOOD' : 'BAD';