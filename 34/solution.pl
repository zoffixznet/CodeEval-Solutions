#!/usr/bin/env perl -ln

use 5.014;
use warnings;

length or next;
my ( $nums, $sum ) = split /;/;
my @nums = split /,/, $nums;

my @good_nums;
for my $i_n1 ( 0..$#nums ) {
    for my $i_n2 ( $i_n1+1 ..$#nums ) {
        next unless $nums[$i_n1] + $nums[$i_n2] == $sum;
        push @good_nums, "$nums[$i_n1],$nums[$i_n2]";
    }
}
print @good_nums ? (join ';', @good_nums) : 'NULL';



