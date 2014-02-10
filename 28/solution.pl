#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp;

    my ( $string, $sub ) = split /,/;
    my @string = split //, $string;
    my @sub    = split //, $sub;

    unless ( grep $_ ne '*', @sub ) { say 'true'; next; }

    my $pos = 0;
    my $found = 0;
    my $adj = grep m{[\\*]}, @sub;
    for ( 0..$#string ) {
        my $char = $string[$_];

        $pos++ if $sub[ $pos ] eq '*'
            or $sub[ $pos ] eq '\\';

        next if $pos > 1
            and $char ne $sub[ $pos ]
            and $sub[ $pos - 1 ] eq '*'
            and $sub[ $pos - 2 ] ne '\\';

        $pos = $char eq $sub[ $pos ] ? $pos+1 : 0;
        last if $pos eq @sub;
    }

    $found = 1 if $pos eq @sub;

    say $found ? 'true' : 'false';
}