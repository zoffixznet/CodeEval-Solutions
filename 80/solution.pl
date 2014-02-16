#!/usr/bin/env perl -ln

use 5.014;
use warnings;

# not for the REAL WORLD, but it fits the sample data in the problem
# ... let's face it. THERE'S A MODULE THAT DOES THIS!
s/%([[:xdigit:]]{2})/chr hex $1/ge; # decode URL-encoded stuff
s{(https?://\w+\.\w+)}{\L$1}gi;     # lowercase schema/domain
s{https?://\w+\.\w+\K:80(?=\D)}//g; # get rid of the default port

my ( $uri1, $uri2 ) = split /;/;
print $uri1 eq $uri2 ? 'True' : 'False';
