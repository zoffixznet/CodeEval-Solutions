#!/usr/bin/env perl

use 5.014;
open my $fh, '<', $ARGV[0] or die $!;

# Refused to take an RFC regex... let's try a dumber one
while ( <$fh> ) {
    chomp;
    say /\A\s*(?:[\w.+-]+|"[^"]+")\@[\w.-]*[.][\w]+\s*\z/ ? 'true' : 'false';
}
