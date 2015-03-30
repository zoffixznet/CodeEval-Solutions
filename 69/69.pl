#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

my $matches = 0;
while ( <$fh> ) {
    chomp;
    traverse( split /,/ );
    say $matches;
    $matches = 0;
}

sub traverse {
    my ( $str, $sub ) = @_;

    my ( $letter, $remainder ) = $sub =~ /(.)(.*)/;

    for my $pos ( 0 .. length $str ) {
        next unless index($str, $letter, $pos) == 0;


    }
}
