#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp;
    my ( $one, $two ) = split /;/;
    my %one; @one{ split /,/, $one } = ();
    say join ',', grep exists $one{$_}, split ',', $two;
}