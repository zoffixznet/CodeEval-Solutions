#!/usr/bin/env perl

use 5.014;
use warnings;

say pack('L', 42) eq pack('N', 42) ? 'BigEndian' : 'LittleEndian';