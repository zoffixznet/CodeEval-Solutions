#!/usr/bin/env perl -ln

use 5.014;
use warnings;

my ( $str1, $str2 ) = split /,/;
my @str2 = split //, $str2;

my $is_rotation = 0;
for ( 0 .. $#str2 ) {
    local $" = '';
    if ( $str1 eq "@str2" ) {
        $is_rotation = 1;
        last;
    }
    push @str2, shift @str2;
}

print $is_rotation ? 'True' : 'False';
