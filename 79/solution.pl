#!/usr/bin/env perl

use 5.014;
use warnings;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    chomp;
    s/(\d+),(\d+);//;
    my ( $m, $n, $i, $j, @map, @row ) = ( $1, $2, 0, 0 );
    for ( split // ) {
        push @row, $_;
        $i++;

        if ( $i == $n ) {
            $i = 0;
            $j++;
            push @map, [@row];
            @row = ();
            next;
        }
    }

    for my $j ( 0 .. $m-1 ) {
        for my $i ( 0 .. $n-1 ) {
            # print "$map[$j][$i] ";
            print find_surrounding_mines( \@map, $j, $i, $m, $n );
        }
    }
    say '';
}

sub find_surrounding_mines {
    my ( $map, $row, $col, $m, $n ) = @_;
    return '*'
        if $map->[$row][$col] eq '*';

    my $mine_count = 0;
    for my $j ( $row-1, $row, $row+1 ) {
        next if $j < 0 or $j > $m-1;
        for my $i ( $col-1, $col, $col+1 ) {
            next if $i < 0 or $i > $n-1
                or ( $j == $row and $i == $col );

            $mine_count++ if $map->[$j][$i] eq '*';
        }
    }

    return $mine_count;
}