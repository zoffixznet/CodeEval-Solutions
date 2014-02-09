#!/usr/bin/env perl

use strict;
use warnings;

my $filename = shift;
open my $fh, '<', $filename
    or die "Failed to open $filename: $!\n";

use re::engine::RE2;
while (<$fh>) {
    chomp;
    my ( $pattern, $text ) = split ' ';
    $pattern =~ s/0/A+/g;
    $pattern =~ s/1/(A+|B+)/g;
    print $text =~ /^$pattern$/ ? 'Yes' : 'No', "\n";
}