#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

my $sum;
while ( <$fh> ) {
    chomp;
    $sum += $_;
}
say $sum;