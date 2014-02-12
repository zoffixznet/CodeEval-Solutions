#!/usr/bin/env perl

use 5.014;
use warnings;
open my $fh, '<', $ARGV[0] or die $!;
say +(sprintf("%b", $_) =~ tr/1//) % 3 while <$fh>;
# Props to BenGoldberg for figuring this shit out without having to
# generate the entire fucking string