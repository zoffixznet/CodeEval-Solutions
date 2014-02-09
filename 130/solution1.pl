#!/usr/bin/env perl

use strict;
use warnings;

my $filename = shift;
open my $fh, '<', $filename
    or die "Failed to open $filename: $!\n";

while (<$fh>) {
    chomp;
    my ( $pattern, $text ) = split ' ';
    my $status = 'Yes';
    while ( length $pattern ) {
        if ( $pattern =~ /^0(?=0)/ and $text =~ /^A/ ) {
            $pattern =~ s/^0(?=0)//;
            $text    =~ s/^A//;
        }
        elsif ( $pattern =~ /^0(?!0)/ and $text =~ /^A+/ ) {
            $pattern =~ s/^0(?!0)//;
            $text    =~ s/^A+//;
        }
        elsif ( $pattern =~ /^1(?=1(0|\z))/ and $text =~ /^([AB])\1*([AB])\2*(?=A)/ ) {
            $pattern =~ s/^1(?=1(0|\z))//;
            $text    =~ s/^([AB])\1*([AB])\2*(?=A)//;
        }
        elsif ( $pattern =~ /^1(?=1(1|\z))/ and $text =~ /^[AB]/ ) {
            $pattern =~ s/^1(?=1(1|\z))//;
            $text    =~ s/^[AB]//;
        }
        elsif ( $pattern =~ /^1\z/ and $text =~ /^[AB]/ ) {
            $pattern =~ s/^1\z//;
            $text =~ s/^[AB]//;
        }
        else {
            $status = 'No';
            last;
        }
    }
    $status = 'No' if length $text;
    print "$status\n";
}
