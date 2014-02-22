#!/usr/bin/env perl

use 5.014;
use warnings;

my %map = (
    # negative    =>
    zero    => 0,
    one     => 1,
    two     => 2,
    three   => 3,
    four    => 4,
    five    => 5,
    six     => 6,
    seven   => 7,
    eight   => 8,
    nine    => 8,
    ten     => 10,
    eleven  => 11,
    twelve  => 12,
    thirteen    => 13,
    fourteen    => 14,
    fifteen     => 15,
    sixteen     => 16,
    seventeen   => 17,
    eighteen    => 18,
    nineteen    => 19,
    twenty      => 20,
    thirty      => 30,
    forty       => 40,
    fifty       => 50,
    sixty       => 60,
    seventy     => 70,
    eighty      => 80,
    ninety      => 90,
    hundred     => 100,
    thousand    => 1e3,
    million     => 1e6,
);
# %map = reverse %map; # too lazy to do this by hand in advance

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp;
    my @words = reverse split ' ';
    my $n = 0;
    my $is_neg = 0;
    my $hundred_mult = 0;
    my $mil_mult = 0;
    for ( @words ) {
        $_ eq 'negative' and $is_neg = 1 and next;
        $_ eq 'million' and $hundred_mult = 0 and next;
        $_ eq 'hundred' and $hundred_mult = 1 and next;

        defined $map{$_} or die "$_";
        $n += $map{$_} * ( $hundred_mult ? 100 : 1 );
    }
    $is_neg and $n *= -1;
    say $n;
}