package FFI::Performance::Raw;

use strict;
use warnings;
use FFI::Raw;
use FFI::CheckLib;
use base qw( Exporter );

our @EXPORT = qw( test1 test2 test3 );

my $lib = find_lib lib => 'foo', libpath => 'foo';

die "no such library $lib" unless -e $lib;

my $test1 = FFI::Raw->new(
  $lib, 'test1',
  FFI::Raw::int,
  FFI::Raw::int,
);

my $test2 = FFI::Raw->new(
  $lib, 'test2',
  FFI::Raw::str,
  FFI::Raw::str,
);

my $test3 = FFI::Raw->new(
  $lib, 'test3',
  FFI::Raw::int,
  FFI::Raw::int,
  FFI::Raw::int,
  FFI::Raw::int,
  FFI::Raw::int,
  FFI::Raw::int,
  FFI::Raw::int,
  FFI::Raw::int,
  FFI::Raw::int,
  FFI::Raw::int,
  FFI::Raw::int,
);

sub test1 { $test1->call(@_) }
sub test2 { $test2->call(@_) }
sub test3 { $test3->call(@_) }

1;
