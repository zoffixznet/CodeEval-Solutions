#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

while ( <$fh> ) {
    chomp;
    my ( $nums1, $nums2 ) = split /\|/;
    my @nums1 = $nums1 =~ /\d+/g;
    my @nums2 = $nums2 =~ /\d+/g;

    my @out;
    for ( 0..$#nums1 ) {
        push @out, $nums1[$_] * $nums2[$_];
    }
    say "@out";
}
