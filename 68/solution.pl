#!/usr/bin/env perl

use 5.014;
use warnings;

open my $fh, '<', $ARGV[0] or die $!;
local $/;
LINES: while (<$fh>) {
    chomp;
    my @stack;
    my %rev = qw/[ ] { } ( )/;
    for ( split // ) {
        if ( /[[{(]/ ) {
            push @stack, $rev{$_};
            next;
        }

        if ( /[)}\]]/ ) {
            if ( $stack[-1] ne $_ ) {
                say 'False';
                next LINES;
            }
            pop @stack;
        }
    }
    say @stack ? 'False' : 'True';
}