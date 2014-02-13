#!/usr/bin/env perl

use 5.014;
use warnings;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp;

    my ( $chars, $enc ) = /(.+?)([01]+)$/;
    my @chars = split //, $chars;

    $enc =~ tr/\n\r//d; # challenge says we might have these "somewhere"

    my $message;
    SEQ: while ( $enc =~ s/(.{3})// ) {
        last if $1 eq '000';
        my $seg_len = oct '0b' . $1;
        while ( $enc =~ s/(.{$seg_len})// ) {
            my $char_num = enc_to_num($1) // last;
            print $chars[ $char_num - 1 ];
        }
    }
    say '';
}

sub enc_to_num {
    my $enc = shift;

    $enc =~ tr/0//
        or return; # we got all 1s; this is an end sequence.

    my $len = length($enc);
    my $offset = 1;
    $offset += 2**$len - 1 while --$len;
    return $offset + oct '0b' . $enc;
}
