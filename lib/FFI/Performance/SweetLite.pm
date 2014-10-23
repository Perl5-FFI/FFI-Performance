package FFI::Performance::SweetLite;

use strict;
use warnings;
use Archive::Libarchive::FFI::SweetLite ();
use base qw( Exporter );

our @EXPORT = qw( test1 test2 test3 );

my $lib = 'foo/libfoo.so';

die "no such library $lib" unless -e $lib;

BEGIN {
  no warnings 'once';
  *ffi_lib = \&Archive::Libarchive::FFI::SweetLite::ffi_lib;
  *attach_function = \&Archive::Libarchive::FFI::SweetLite::attach_function;
  *_int = \&Archive::Libarchive::FFI::SweetLite::_int;
  *_str = \&Archive::Libarchive::FFI::SweetLite::_str;
};


ffi_lib \$lib ;

attach_function 'test1', [ _int ], _int ;
attach_function 'test2', [ _str ], _str ;
attach_function 'test3', [ _int, _int, _int, _int, _int, _int, _int, _int, _int, _int ], _int ;

1;
