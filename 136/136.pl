#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

my $cur_pos;
while ( defined(my $line = <$fh>) ) {
    chomp $line;
    ( my $out, $cur_pos ) = pass( $line, $cur_pos );
    say $out;
}

sub pass {
    my ( $line, $cur_pos ) = @_;
    $line =~ /(.*C)/;
    my $cp = length $1;
    $line =~ /(.*_)/;
    my $g = length $1;

    unless ( defined $cur_pos ) {
        $cur_pos = defined $cp ? $cp : $g;
    }

    if ( defined $cp ) {
        my $delta = $cp - $cur_pos;
        if ( $delta == 0 ) {
            return ( $line =~ tr/C/|/r, $cur_pos );
        }
        elsif ( $delta == -1 ) {
            return ( $line =~ tr{C}{/}r, $cur_pos - 1 );
        }
        elsif ( $delta == 1 ) {
            return ( $line =~ tr{C}{\\}r, $cur_pos + 1 );
        }
    }

    my $delta = $g - $cur_pos;

    if ( $delta == 0 ) {
        return ( $line =~ tr/_/|/r, $cur_pos ) ;
    }
    elsif ( $delta == -1 ) {
        return ( $line =~ tr{_}{/}r, $cur_pos - 1 );
    }
    elsif ( $delta == 1 ) {
        return ( $line =~ tr{_}{\\}r, $cur_pos + 1 );
    }
}