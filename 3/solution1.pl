#!/usr/bin/env perl

use 5.014;
use warnings;

my $max = 1000;

NUM: for my $num ( reverse 1 .. $max - 1) {
    $num % $_ == 0 and next NUM
        for 2 .. sqrt $num;

    # We have a prime number, if we got up to here
    $num eq reverse $num
        or next;

    say $num;
    exit;
}