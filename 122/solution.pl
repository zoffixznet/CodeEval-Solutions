#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    tr/a-j0-9//cd;
    s/([a-j])/ord($1)-97/eg;
    say length() ? $_ : 'NONE';
}