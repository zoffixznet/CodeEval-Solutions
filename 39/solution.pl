#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

NUM: while ( defined( my $num = <$fh> ) ) {
    chomp $num;
    my $count = 0;
    # a hack; we're assuming happy numbers iterate fewer than 100 times
    while ( $count < 100 ) {
        $count++;
        $num = eval join '+', map $_*$_, split //, $num;
        $num == 1 or next;
        say 1;
        next NUM;
    }
    say 0;
}