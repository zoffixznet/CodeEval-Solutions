#!/usr/bin/env perl

use 5.014;
use warnings;

open my $fh, '<', $ARGV[0] or die $!;

while ( <$fh> ) {
    chomp;
    my ( $sAx, $sAy, $eAx, $eAy, $sBx, $sBy, $eBx, $eBy ); # = split /,/;

    my $is_overlap = (
        ( # X overlaps
            $sAX
        )
        and
        ( # Y overlaps

        )
    );

    say $is_overlap ? 'True' : 'False';
}

__END__

$sAx = -3
$sAy = 3
$eAx = -1
$eAy = 1

$sBx = -2
$sBy = 4
$eBx = 2
$eBy = 2