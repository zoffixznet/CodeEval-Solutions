#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

while ( <$fh> ) {
    say +(sort { length $b <=> length $a } /\w+/g )[0];
}
