use strict;
use warnings;
use Test::More tests => 6;

use_ok 'FFI::Performance';
note $INC{'FFI/Performance.pm'};
use_ok 'FFI::Performance::Raw';
use_ok 'FFI::Performance::Sweet';
use_ok 'FFI::Performance::Platypus';
use_ok 'FFI::Performance::Inline';

Inline->init;

SKIP: {
  skip 'requires XS build', 1 if $INC{'FFI/Performance.pm'} !~ /blib/;

use_ok 'FFI::Performance::XS';

}


