#!/usr/bin/env perl

use 5.014;
use warnings;


package ZofNode;

sub new {
    my ( $class, $val ) = @_;
    return bless { data => $val }, $class;
}

sub insert {
    my ( $self, $tree, $val ) = @_;

    unless ( $tree ) {
        $tree = Node->new( $val );
        return;
    }

    if ( $val < $tree->{data} ) {
        $tree->insert
    }
}

__END__

void insert(node ** tree, int val)
{
    node *temp = NULL;
    if(!(*tree))
    {
        temp = (node *)malloc(sizeof(node));
        temp->left = temp->right = NULL;
        temp->data = val;
        *tree = temp;
        return;
    }

    if(val < (*tree)->data)
    {
        insert(&(*tree)->left, val);
    }
    else if(val > (*tree)->data)
    {
        insert(&(*tree)->right, val);
    }

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