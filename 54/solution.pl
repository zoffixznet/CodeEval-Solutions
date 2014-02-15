#!/usr/bin/env perl

use 5.014;
use warnings;

my %reg = (
    'PENNY' => 0.01,
    'NICKEL' => 0.05,
    'DIME' => 0.10,
    'QUARTER' => 0.25,
    'HALF DOLLAR' => 0.50,
    'ONE' => 1.00,
    'TWO' => 2.00,
    'FIVE' => 5.00,
    'TEN' => 10.00,
    'TWENTY' => 20.00,
    'FIFTY' => 50.00,
    'ONE HUNDRED'  => 100.00
);


open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp;
    my ( $pp, $ch ) = split /;/;
    $pp > $ch  and say 'ERROR' and next;
    $pp == $ch and say 'ZERO'  and next;

    my $change = $ch - $pp;
    my @change;
    for my $name ( sort { $reg{$b} <=> $reg{$a} } keys %reg ) {
        my $value = $reg{$name};
        while ( $change and $change >= $value ) {
            push @change, $name;
            $change = sprintf '%.2f', $change - $value;
        }
        $change == 0 and last;
    }
    say join ',', @change;
}
