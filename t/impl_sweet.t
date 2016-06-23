use strict;
use warnings;
use Test2::Require::Module 'FFI::Sweet';
use Test::More;
use FFI::Performance::Sweet;

is test1(22), 22, 'test1(22) = 22';
is test2("hi there"), "hi there", "test2('hi there') = 'hi there'";
is test3(1,2,3,4,5,6,7,8,9,10), 1+2+3+4+5+6+7+8+9+10, "test3(1,2,3,4,5,6,7,8,9,10) = " . (1+2+3+4+5+6+7+8+9+10);

done_testing;
