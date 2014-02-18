#!/usr/bin/env perl

use 5.014;
use warnings;

my $tree;
insert($tree, $_)
    for qw/30  8  52  3  20  10  29/;

open my $fh, '<', $ARGV[0] or die $!;

while (<$fh>) {
    say find_lowest_ancestor($tree, sort { $a <=> $b } split ' ');
}

sub find_lowest_ancestor {
    my ( $tree, $n1, $n2 ) = @_;

    my $v = $tree->{val};
    if ( $n1 <= $v and $n2 <= $v ) {
        return $v if $n1 == $v or $n2 == $v;
        return find_lowest_ancestor( $tree->{left}, $n1, $n2 );
    }

    return find_lowest_ancestor( $tree->{right}, $n1, $n2 )
        if $n1 > $v and $n2 > $v;

    return $v;
}

sub insert {
    my ( $tree, $val ) = @_;

    unless ( $tree ) {
        $_[0] = { val => $val, };
        return;
    }

    insert(
        $tree->{ $tree->{val} < $val ? 'right' : 'left' },
        $val,
    );
}

__END__
    30
    |
  ____
  |   |
  8   52
  |
____
|   |
3  20
    |
   ____
  |   |
  10 29