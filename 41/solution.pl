#!/usr/bin/env perl -ln

length or next;
my %seen;
print grep $seen{$_}++, /\d+(?=,|\z)/g;