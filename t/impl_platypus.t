use strict;
use warnings;
use Test::More tests => 5;
use FFI::Performance::Platypus;

is test1(22), 22, 'test1(22) = 22';
is test2("hi there"), "hi there", "test2('hi there') = 'hi there'";
is test3(1,2,3,4,5,6,7,8,9,10), 1+2+3+4+5+6+7+8+9+10, "test3(1,2,3,4,5,6,7,8,9,10) = " . (1+2+3+4+5+6+7+8+9+10);
is test4(\3, \4), 9, 'test4(\3,\4) = 9';
is test5(9, [1,2,3,4,5,6,7,8,9]), 45, "test5(9, [1,2,3,4,5,6,7,8,9]) = 45";

