#!/usr/bin/env perl -ln

use 5.014;
use warnings;

my $s = join '', 'a' .. 'z';
$_ = quotemeta lc;
eval "\$s =~ tr/$_//d";
print length $s ? $s : 'NULL';