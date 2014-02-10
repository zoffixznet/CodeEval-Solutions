#!/usr/bin/env perl

use 5.014;

open my $fh, '<', $ARGV[0] or die $!;

my $stack = ZofStack->new;
while ( <$fh> ) {
    $stack->push($_) for /[-\d]+/g;
    my @out;
    { push @out, $stack->pop; redo if defined $stack->pop; }
    say "@out";
}


package ZofStack;
use 5.014;

sub new { bless [], shift }

sub push {
    my ( $self, $what ) = @_;
    push @$self, $what;
}

sub pop {
    my $self = shift;
    pop @$self;
}