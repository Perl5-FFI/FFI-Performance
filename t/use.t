use strict;
use warnings;
use Test::More tests => 4;


use_ok 'FFI::Performance';
note $INC{'FFI/Performance.pm'};
use_ok 'FFI::Performance::Raw';
use_ok 'FFI::Performance::Sweet';

SKIP: {
  skip 1, 'requires XS build' if $INC{'FFI/Performance.pm'} !~ /blib/;

use_ok 'FFI::Performance::XS';

}

