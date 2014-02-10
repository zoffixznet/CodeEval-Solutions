#!/usr/bin/env perl

use 5.014;

my $filename = shift;
open my $fh, '<', $filename
    or die "Failed to open $filename: $!\n";

use re::engine::RE2;
while (<$fh>) {
    chomp;
    my ( $pattern, $text ) = split ' ';
    $pattern =~ s/0/A+/g;
    $pattern =~ s/1/(?:A+|B+)/g;
    say $text =~ /^$pattern$/ ? 'Yes' : 'No';
}
