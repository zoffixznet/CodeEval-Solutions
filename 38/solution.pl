#!/usr/bin/env perl

use 5.014;
use warnings;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp;
    my ( $len, $chars ) = split /,/;
    my @chars = split //, $chars;

    my %t;
    @t{
        grep length($_) == $len,
            glob(join '', map "{$_}"x@chars, join ',', @chars, '')
    } = ();

    say join ',', sort keys %t;
}