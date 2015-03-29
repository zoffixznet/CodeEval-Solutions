#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

while ( defined(my $line = <$fh>) ) {
    chomp $line;
    if ( length $line <= 55 ) {
        say $line;
        next;
    }

    $line =~ s/.{40}\K.*//;
    $line =~ s/ \S*$//;
    say $line . '... <Read More>';
}
