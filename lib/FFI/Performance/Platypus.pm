package FFI::Performance::Platypus;

use strict;
use warnings;
use FFI::Platypus::Declare
  'int', 'string';
use base qw( Exporter );

our @EXPORT = qw( test1 test2 test3 );

my $lib = 'foo/libfoo.so';

die "no such library $lib" unless -e $lib;
  
lib $lib;

function test1 => [int] => int;
function test2 => [string] => string;
function test3 => [int,int,int,int,int,int,int,int,int,int] => int; 

1;
