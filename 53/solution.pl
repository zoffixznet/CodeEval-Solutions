#!/usr/bin/env perl

use 5.014;
use warnings;

open my $fh, '<', $ARGV[0] or die $!;

while ( <$fh> ) {
    my @z = /^.*?(\S.*?|.*?\S).*?\1/g;
    use Acme::Dump::And::Dumper;
    die DnD [ @z ];
    for ( sort { length $b <=> length $a } @z ) {
        say
    }
}