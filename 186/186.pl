#!perl -n

use 5.014;

chomp;
my ( $l, @nums ) = split /[;\s]/;
my $max = 0;

for ( 0 .. $#nums - --$l ) {
    my $sum = 0;
    $sum += $_ for @nums[$_ .. $_+$l ];
    $max = $sum if $sum > $max;
}

say $max;