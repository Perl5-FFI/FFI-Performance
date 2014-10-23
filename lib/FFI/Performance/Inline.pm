package FFI::Performance::Inline;

use strict;
use warnings;
use File::chdir;
use Inline::C 0.56 ();
use Inline
  C => 'DATA',
  inc => "-I$CWD/foo",
  libs => "-L$CWD/foo -lfoostatic",
  ENABLE => 'AUTOWRAP';
use base qw( Exporter );

our @EXPORT = qw( test1 test2 test3 );

1;

__DATA__
__C__

#include <foo.h>

extern int test1(int);
extern const char* test2(const char *);
extern int test3(int,int,int,int,int,int,int,int,int,int);
