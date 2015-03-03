package FFI::Performance::OO;

use strict;
use warnings;
use FFI::Performance::XS ();
use base qw( Exporter );

our @EXPORT = qw( test1 test2 test3 );

my $object = FFI::Performance::XS->new;

sub test1 { $object->test1_oo(@_) }
sub test2 { $object->test2_oo(@_) }
sub test3 { $object->test3_oo(@_) }

1;
