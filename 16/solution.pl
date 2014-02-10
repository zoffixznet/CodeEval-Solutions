#!/usr/bin/env perl

use 5.014;
open my $fh, '<', $ARGV[0] or die $!;
say sprintf('%b', $_) =~ tr/1// while <$fh>;
