package FFI::Performance::Sweet;

use strict;
use warnings;
use FFI::Sweet ();
use base qw( Exporter );

our @EXPORT = qw( test1 test2 test3 );

my $lib = 'foo/libfoo.so';

die "no such library $lib" unless -e $lib;

BEGIN {
  no warnings 'once';
  *ffi_lib = \&FFI::Sweet::ffi_lib;
  *attach_function = \&FFI::Sweet::attach_function;
  *_int = \&FFI::Sweet::_int;
  *_str = \&FFI::Sweet::_str;
};


ffi_lib \$lib ;

attach_function 'test1', [ _int ], _int ;
attach_function 'test2', [ _str ], _str ;
attach_function 'test3', [ _int, _int, _int, _int, _int, _int, _int, _int, _int, _int ], _int ;

1;
