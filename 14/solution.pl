#!/usr/bin/env perl

use 5.014;
use warnings;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp;

    my @chars = split //;
    my %t; $t{$_}++ for @chars;
    my @perms;
    PERM: for my $perm ( map glob("{$_}" x @chars), join ',', @chars ) {
        for ( @chars ) {
            $t{$_} == eval "\$perm =~ tr/$_//"
                or next PERM;
        }
        push @perms, $perm;
    }

    say join ',', sort @perms;
}