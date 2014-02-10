#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

while ( <$fh> ) {
    chomp;
    my @bits = split /,/;
    my @nums  = grep /\A\d+\z/, @bits;
    my @words = grep !/\A\d+\z/, @bits;

    local $" = ',';
    say join '|', @words ? "@words" : (), @nums ? "@nums" : ();

}
