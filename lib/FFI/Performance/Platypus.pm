package FFI::Performance::Platypus;

use strict;
use warnings;
use FFI::Platypus::Declare
  'int', 'string',
  [ 'int*' => 'int_p'],
  [ 'int[]' => 'int_a'];
use FFI::CheckLib qw( find_lib );
use base qw( Exporter );

our @EXPORT = qw( test1 test2 test3 test4 test5 );

my $lib = find_lib lib => 'foo', libpath => 'foo';

die "no such library $lib" unless -e $lib;
  
lib $lib;

attach test1 => [int] => int;
attach test2 => [string] => string;
attach test3 => [int,int,int,int,int,int,int,int,int,int] => int; 
attach test4 => [int_p, int_p] => int;
attach test5 => [int, int_a] => int;

1;
