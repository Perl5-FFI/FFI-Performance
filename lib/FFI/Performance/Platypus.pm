package FFI::Performance::Platypus;

use strict;
use warnings;
use FFI::Platypus qw( ffi_type ffi_signature ffi_lib ffi_sub );
use base qw( Exporter );

our @EXPORT = qw( test1 test2 test3 );

my $lib = 'foo/libfoo.so';

die "no such library $lib" unless -e $lib;
  
$lib = ffi_lib $lib;


my $int = ffi_type c => 'int';

ffi_sub [$lib], 'test1', [$int, $int];
ffi_sub [$lib], 'test3', [$int, $int, $int, $int, $int, $int, $int, $int, $int, $int, $int];

1;
