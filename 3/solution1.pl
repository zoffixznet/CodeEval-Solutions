#!/usr/bin/env perl

use strict;
use warnings;

my $max = 1000;

NUM: for my $num ( reverse 1 .. $max - 1) {
    $num % $_ == 0 and next NUM
        for 2 .. sqrt $num;

    # We have a prime number, if we got up to here
    $num =~ /\A(.+)${\ (length($num) % 2 ? '.' : '') }\1\z/
        or next;

    # We have a pallindrome, if we got up to here.
    print "$num\n";
    exit;
}