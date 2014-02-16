#!/usr/bin/env perl -ln

use 5.014;
use warnings;

my @nums = split /,/;
my @four_nums = splice @nums, 0, 4;
