#!/usr/bin/perl -wT

use strict;
use Test::More qw(no_plan);

BEGIN {
	use_ok('Array::Utils');
}

require_ok('Array::Utils');

use Array::Utils qw(:all);

my @a = qw( a b c d );
my @b = qw( c d e f );

ok ( !same_members(@a, @b), "Array members comparison - different arrays" );
ok ( same_members(@a, @a), "Array members comparison - same array" );

my @union_ethalon = qw( a b c d e f );
my @isect_ethalon = qw( c d );
my @diff_ethalon = qw( a b e f );

my @union = unique(@a, @b);
is ( scalar(@union), 6, "Array unique union count" );
ok ( same_members( @union, @union_ethalon ), "Array unique union" );

my @isect = intersect(@a, @b);
is( scalar(@isect), 2, "Array intersection count" );
ok ( same_members( @isect, @isect_ethalon ), "Array intersection" );

my @diff = array_diff(@a, @b);
is ( scalar(@diff), 4, "Array symmetric difference count" );
ok ( same_members( @diff, @diff_ethalon), "Array symmetric difference" );
