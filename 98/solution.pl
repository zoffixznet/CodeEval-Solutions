#!/usr/bin/env perl -ln

my ( $cx, $cy, $r, $px, $py ) = /-?\d+(?:\.\d+)?/g;
print sqrt( ($cx-$px)**2 + ($cy-$py)**2 ) < $r ? 'true' : 'false';
