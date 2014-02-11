#!/usr/bin/env perl

use 5.014;
use warnings;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp; length or next;
    my ( $str, $sub ) = split /,/;
    say $str =~ /\Q$sub\E\z/ ? 1 : 0;
}