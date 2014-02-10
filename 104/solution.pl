#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

my $n = 0;
my %map = map +( $_ => $n++ ), qw/
    zero one two three four five six seven eight nine
/;

while (<$fh>) {
    my @nums = /\w+/g;
    print "$map{$_}" for @nums;
    say '';
}