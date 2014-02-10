#!/usr/bin/env perl

use 5.014;
open my $fh, '<', $ARGV[0] or die $!;
say +(split)[-2] while <$fh>;