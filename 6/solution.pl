#!/usr/bin/env perl

use 5.014;
use warnings;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp; length or next;
    my ( $one, $two ) = split /;/;
    my ( %one, %two );
    @one{
        glob join '', map "{$_,}", split //, $one
    } = ();
    @two{
        glob join '', map "{$_,}", split //, $two
    } = ();
#    use Acme::Dump::And::Dumper;
#    die DnD [ sort keys %one ];

    say +(
        sort { length $b <=> length $a }
            grep exists $two{$_}, keys %one
    )[0];
}
