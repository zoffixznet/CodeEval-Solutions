#!/usr/bin/env perl

use 5.014;
use warnings;

open my $fh, '<', $ARGV[0] or die $!;

while (defined(my $num=<$fh>)) {
    chomp $num; length $num or next;
    while ( $num > 0 ) {
        if ( $num >= 1000 ) {
            print 'M' x ($num/1000);
            $num -= int($num/1000) * 1000;
        }
        elsif ( $num >= 500 and $num < 900 ) {
            print 'D';
            $num -= 500;
        }
        elsif ( $num >= 900 ) {
            print 'CM';
            $num -= 900;
        }
        elsif ( $num >= 100 and $num < 400 ) {
            print 'C' x ($num/100);
            $num -= int($num/100) * 100;
        }
        elsif ( $num >= 400  ) {
            print 'CD';
            $num -= 400;
        }
        elsif ( $num >= 50 and $num < 90 ) {
            print 'L';
            $num -= 50;
        }
        elsif ( $num >= 90 ) {
            print 'XC';
            $num -= 90;
        }
        elsif ( $num >= 10 and $num < 40 ) {
            print 'X' x ($num/10);
            $num -= int($num/10) * 10;
        }
        elsif ( $num >= 40  ) {
            print 'XL';
            $num -= 40;
        }
        elsif ( $num >= 5 and $num < 9 ) {
            print 'V';
            $num -= 5;
        }
        elsif ( $num >= 9 ) {
            print 'IX';
            $num -= 9;
        }
        elsif ( $num >= 1 and $num < 4 ) {
            print 'I' x ($num);
            $num = 0;
        }
        elsif ( $num >= 4  ) {
            print 'IV';
            $num = 0;
        }
    }
    say '';
}