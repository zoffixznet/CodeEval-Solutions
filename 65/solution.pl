#!/usr/bin/env perl

use 5.014;
use warnings;

open my $fh, '<', $ARGV[0] or die $!;

my @board = (
    [qw/A B C E/],
    [qw/S F C S/],
    [qw/A D E E/],
);

while (<$fh>) {
    chomp;
    my $is_possible = 0;
    SEARCH: for my $y ( -1 .. 2 ) {
        for my $x ( -1 .. 3 ) {
            next unless find_path($_, $x, $y);
            $is_possible = 1;
            last SEARCH;
        }
    }
    say $is_possible ? 'True' : 'False';
}

sub find_path {
    my ( $s, $x, $y ) = @_;
    return 1 unless length $s;

    my ( $l, $rest ) = split //, $s, 2;
    my $is_possible = 0;
    SEARCH: for my $p_y ( $y - 1, $y, $y + 1 ) {
        for my $p_x ( $x - 1, $x, $x + 1 ) {
            next if $p_y > 2 or $p_x > 3;
            next if $p_y < 0 or $p_x < 0;
            next if $p_y == $y and $p_x == $x;
            next if $p_y == $y+1 and $p_x == $x+1;
            next if $p_y == $y-1 and $p_x == $x-1;
            next if $p_y == $y-1 and $p_x == $x+1;
            next if $p_y == $y+1 and $p_x == $x-1;

            next unless $board[$p_y][$p_x] eq $l;
            ( $is_possible, $x, $y ) = ( 1, $p_x, $p_y );
            last SEARCH;
        }
    }
    return $is_possible ? find_path($rest, $x, $y ) : 0;
}
