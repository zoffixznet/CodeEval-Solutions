#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

while ( <$fh> ) {
    chomp;
    my %t; $t{$_}++ for split //;
    say +( grep $t{$_} == 1, split //)[0];
}

