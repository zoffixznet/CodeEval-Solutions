#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp;
    say lc;
}