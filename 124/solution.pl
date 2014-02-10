#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp;
    my $offset = 0;
    my @route;
    for ( sort { $a <=> $b } values %{{split /[,;]\s*/}} ) {
        push @route, $_ - $offset;
        $offset = $_;
    }

    say join ',', @route;
}