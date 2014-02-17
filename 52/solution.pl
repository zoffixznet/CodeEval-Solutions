#!/usr/bin/env perl

use 5.014;
use warnings;

open my $fh, '<', $ARGV[0] or die $!;

my %map = (
    1   => 'One',
    2   => 'Two',
    3   => 'Three',
    4   => 'Four',
    5   => 'Five',
    6   => 'Six',
    7   => 'Seven',
    8   => 'Eight',
    9   => 'Nine',
    10  => 'Ten',
    11  => 'Eleven',
    12  => 'Twelve',
    13  => 'Thirteen',
    14  => 'Fourteen',
    15  => 'Fifteen',
    16  => 'Sixteen',
    17  => 'Seventeen',
    18  => 'Eighteen',
    19  => 'Nineteen',
    20  => 'Twenty',
    30  => 'Thirty',
    40  => 'Forty',
    50  => 'Fifty',
    60  => 'Sixty',
    70  => 'Seventy',
    80  => 'Eighty',
    90  => 'Ninety',
    1e2 => 'Hundred',
    1e3 => 'Thousand',
    1e6 => 'Million',
);

while (defined(my $num=<$fh>)) {
    chomp $num;

    $num =~ /^#/ and next;
    $num =~ /---/ and last;

    my $answer;

    my @divs = ( 1e6, 1e3 );
    for my $div ( @divs ) {
        my $mult = int( $num/$div );
        next unless $mult;
        $num -= $div*$mult;
        $answer .= get_lows($mult) . $map{$div};
    }

    $answer .= get_lows($num);

    say $answer . 'Dollars';
}

sub get_lows {
    my $num = shift;

    my $answer = '';

    if ( $num >= 100 ) {
        my $mult = int( $num/100 );
        if ( $mult ) {
            $num -= $mult*100;
            $answer .= $map{$mult} . $map{100};
        }
    }

    my @divs = reverse 1..20, map $_*10, 3..9;
    for my $div ( @divs ) {
        next unless $num >= $div;
        $num -= $div;
        $answer .= $map{$div};
    }

    return $answer;
}