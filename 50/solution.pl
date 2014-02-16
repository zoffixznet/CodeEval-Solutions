#!/usr/bin/env perl -ln

use 5.014;
use warnings;

my ( $str, $reps ) = split /;/;

while ( $reps =~ s/([01]+),([01]+)// ) {
    my ( $what, $repl ) = ( $1, $2 );
    $repl =~ tr/01/ab/;
    $str =~ s/\Q$what\E/$repl/g;
}
$str =~ tr/ab/01/;
print $str;
