#include <foo.h>
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

MODULE = FFI::Performance::XS   PACKAGE = FFI::Performance::XS

int
test1(input)
	int input


const char *
test2(input)
	const char *input


int
test3(i1,i2,i3,i4,i5,i6,i7,i8,i9,i10)
	int i1
	int i2
	int i3
	int i4
	int i5
	int i6
	int i7
	int i8
	int i9
	int i10
