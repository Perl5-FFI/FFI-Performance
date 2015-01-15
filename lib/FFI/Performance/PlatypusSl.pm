package FFI::Performance::PlatypusSl;

use strict;
use warnings;
use FFI::Platypus;
use base qw( Exporter );

our @EXPORT = qw( test1 test2 test3 );

my $lib = 'foo/libfoo.so';

die "no such library $lib" unless -e $lib;

my $ffi = FFI::Platypus->new;
$ffi->lib($lib);

my $test1 = $ffi->function(test1 => ['int'] => 'int');
my $test2 = $ffi->function(test2 => ['string'] => 'string');
my $test3 = $ffi->function(test3 => ['int','int','int','int','int','int','int','int','int','int'] => 'int');

sub test1 { $test1->call(@_) }
sub test2 { $test2->call(@_) }
sub test3 { $test3->call(@_) }

1;
