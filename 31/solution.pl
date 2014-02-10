#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp;
    length or next;
    my ( $string, $char ) = split /,/;
    say $string =~ /(.*)$char/ ? length $1 : -1;
}