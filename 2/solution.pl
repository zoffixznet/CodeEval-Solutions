#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;
chomp( my $N = <$fh> );
for ( sort { length $b <=> length $a } <$fh> ) {
    $N-- or last;
    chomp;
    say;
}

