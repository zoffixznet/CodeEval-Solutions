#!/usr/bin/env perl -ln

use 5.014;
use warnings;

my ( $num, $before, $operation, $after ) = /(\d+)\s+([a-z]*)([+-])?([a-z]*)/;
$before = length $before;
$after  = length $after;
print eval "substr(\$num, 0, \$before) $operation substr(\$num, \$before, \$before+\$after)";