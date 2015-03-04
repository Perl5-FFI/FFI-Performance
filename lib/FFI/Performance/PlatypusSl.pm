package FFI::Performance::PlatypusSl;

use strict;
use warnings;
use FFI::Platypus;
use FFI::CheckLib qw( find_lib );
use base qw( Exporter );

our @EXPORT = qw( test1 test2 test3 test4 test5 );

my $lib = find_lib lib => 'foo', libpath => 'foo';

die "no such library $lib" unless -e $lib;

my $ffi = FFI::Platypus->new;
$ffi->lib($lib);

my $test1 = $ffi->function(test1 => ['int'] => 'int');
my $test2 = $ffi->function(test2 => ['string'] => 'string');
my $test3 = $ffi->function(test3 => ['int','int','int','int','int','int','int','int','int','int'] => 'int');
my $test4 = $ffi->function(test4 => ['int*', 'int*'] => 'int');
my $test5 = $ffi->function(test5 => ['int', 'int[]'] => 'int');

sub test1 { $test1->call(@_) }
sub test2 { $test2->call(@_) }
sub test3 { $test3->call(@_) }
sub test4 { $test4->call(@_) }
sub test5 { $test5->call(@_) }

1;
