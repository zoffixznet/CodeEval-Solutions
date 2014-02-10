#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

my %map = (
    1   => 'I',
    5   => 'V',
    10  => 'X',
    50 => 'L',
    100 => 'C',
    500 => 'D',
    1000 => 'M',
    4    => 'IV',
    9    => 'IX',
    40   => 'XL',
    90   => 'XC',
    24  => 'XXIV',
    39  => 'XXXIX',
    44  => 'XLIV',
    49  => 'XLIX',
    94  => 'XCIV',
);

# my @divisors = qw/
    # 1000  500  100  94  90  49  50  44  39  40  24  9  10  4  5  1
# /;

my @divisors = sort { $b <=> $a } keys %map;

# use Acme::Dump::And::Dumper;
# die DnD [ @divisors ];

while (defined(my $num=<$fh>)) {
    chomp $num;
    while ( 1 ) {
        my ( $div ) = grep $num/$_ == 1, @divisors;
        $div or ( $div ) = grep $num/$_ > 1, @divisors;
        print $map{$div};
        $num -= $div;
        $num <= 0 and last;
    }
    say;
}
