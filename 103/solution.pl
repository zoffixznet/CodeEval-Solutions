#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    my @nums = /\d+/g;
    my %temp; $temp{$_}++ for @nums;
    delete @temp{ grep $temp{$_} > 1, keys %temp };

    unless ( keys %temp ) { say 0; next; }

    my ( $win_num ) = sort { $a <=> $b } keys %temp;
    say map $_+1, grep $nums[$_] == $win_num, 0..$#nums;
}