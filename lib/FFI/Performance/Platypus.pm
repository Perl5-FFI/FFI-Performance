package FFI::Performance::Platypus;

use strict;
use warnings;
use FFI::Platypus::Declare
  'int', 'string';
use FFI::CheckLib qw( find_lib );
use base qw( Exporter );

our @EXPORT = qw( test1 test2 test3 );

my $lib = find_lib lib => 'foo', libpath => 'foo';

die "no such library $lib" unless -e $lib;
  
lib $lib;

attach test1 => [int] => int;
attach test2 => [string] => string;
attach test3 => [int,int,int,int,int,int,int,int,int,int] => int; 

1;
