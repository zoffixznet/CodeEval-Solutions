#!/usr/bin/env perl

use 5.014;
use warnings;

open my $fh, '<', $ARGV[0] or die $!;
my $re = join '|', map "(?:$_)", 11..26;
$re = qr/$re/;
while (defined(my $num = <$fh>)) {
    chomp $num;

    my @digits = split //, $num;
    my $sub_groups = 0;
    for ( 1 .. $#digits ) {
        my $n = join '', @digits[$_-1, $_];
        $sub_groups++
            if $n >= 11 and $n <= 26;
    }

    $sub_groups += length $sub_groups
        if $sub_groups > 1;

    say $sub_groups+1;
}
