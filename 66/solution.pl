#!/usr/bin/env perl

use 5.014;
use warnings;

sub fact {
    my $n = shift;
    return $n <= 1 ? 1 : $n * fact( $n-1 );
}

open my $fh, '<', $ARGV[0] or die $!;

while ( defined(my $level = <$fh>) ) {
    chomp $level;
    $level--; # reminds me of the off-by-one joke

    my @triangle;
    for my $row ( 0 .. $level ) {
        push @triangle, fact($row) / (fact($_) * fact($row-$_))
            for 0 .. $row;
    }
    say "@triangle";
}