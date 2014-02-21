#!/usr/bin/env perl

use 5.014;
use warnings;

my %map = (
    0 => '0',
    1 => '1',
    2 => '{a,b,c}',
    3 => '{d,e,f}',
    4 => '{g,h,i}',
    5 => '{j,k,l}',
    6 => '{m,n,o}',
    7 => '{p,q,r,s}',
    8 => '{t,u,v}',
    9 => '{w,x,y,z}',
);


open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp;
    s/(.)/$map{$1}/g;
    say join ',', glob;
}