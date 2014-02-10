#!/usr/bin/env perl

use 5.014;
use JSON::PP;
open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp; length or next;
    my $json = decode_json($_);

    say eval( join '+', map $_->{id},
        grep ref && $_->{label}, @{ $json->{menu}{items} }
    ) || 0;
}