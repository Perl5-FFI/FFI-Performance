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


int
test1_oo(self, input)
    SV* self
    int input
  CODE:
    RETVAL = test1(input);
  OUTPUT:
    RETVAL


const char *
test2_oo(self, input)
    SV *self
    const char *input
  CODE:
    RETVAL = test2(input);
  OUTPUT:
    RETVAL


int
test3_oo(self, i1,i2,i3,i4,i5,i6,i7,i8,i9,i10)
    SV *self
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
  CODE:
    RETVAL = test3(i1,i2,i3,i4,i5,i6,i7,i8,i9,i10);
  OUTPUT:
    RETVAL


int
test4(i1,i2)
    SV* i1
    SV* i2
  PREINIT:
    int int1, int2;
    int *ptr1, *ptr2;
    SV *sv1, *sv2;
  CODE:
    /* 
     * XS version has an advantage over Platypus
     * in that it can save the SV
     */
    if(SvROK(i1))
    {
      sv1 = SvRV(i1);
      int1 = SvIV(sv1);
      ptr1 = &int1;
    }
    else
      ptr1 = NULL;
    if(SvROK(i2))
    {
      sv2 = SvRV(i2);
      int2 = SvIV(sv2);
      ptr2 = &int2;
    }
    else
      ptr2 = NULL;
    RETVAL = test4(ptr1, ptr2);
    if(ptr1 != NULL && !SvREADONLY(sv1))
        sv_setiv(sv1, *ptr1);
    if(ptr2 != NULL && !SvREADONLY(sv2))
        sv_setiv(sv2, *ptr1);
  OUTPUT:
    RETVAL

int
test4_oo(self,i1,i2)
    SV* self
    SV* i1
    SV* i2
  PREINIT:
    int int1, int2;
    int *ptr1, *ptr2;
    SV *sv1, *sv2;
  CODE:
    if(SvROK(i1))
    {
      sv1 = SvRV(i1);
      int1 = SvIV(sv1);
      ptr1 = &int1;
    }
    else
      ptr1 = NULL;
    if(SvROK(i2))
    {
      sv2 = SvRV(i2);
      int2 = SvIV(sv2);
      ptr2 = &int2;
    }
    else
      ptr2 = NULL;
    RETVAL = test4(ptr1, ptr2);
    if(ptr1 != NULL && !SvREADONLY(sv1))
        sv_setiv(sv1, *ptr1);
    if(ptr2 != NULL && !SvREADONLY(sv2))
        sv_setiv(sv2, *ptr1);
  OUTPUT:
    RETVAL


int
test5(length, array)
    int length
    SV *array
  PREINIT:
    int i,ret;
    AV *av;
    int *intarray;
    int count;
    SV *tmp;
  CODE:
    if(SvROK(array) && SvTYPE(SvRV(array)) == SVt_PVAV)
    {
      av = (AV*) SvRV(array);
      count = av_len(av)+1;
      Newx(intarray, count, int);
      for(i=0,ret=0; i<count; i++)
      {
        intarray[i] = SvIV(*av_fetch(av, i, 1));
      }
    }
    else
      intarray = NULL;
      
    RETVAL = test5(length, intarray);
    
    if(intarray != NULL)
    {
      for(i=0,ret=0; i<count; i++)
      {
        tmp = *av_fetch(av, i, 1);
        if(!SvREADONLY(tmp))
          sv_setiv(tmp, intarray[i]);
      }
      Safefree(intarray);
    }
  OUTPUT:
    RETVAL

int
test5_oo(self,length, array)
    SV *self
    int length
    SV *array
  PREINIT:
    int i,ret;
    AV *av;
    int *intarray;
    int count;
    SV *tmp;
  CODE:
    if(SvROK(array) && SvTYPE(SvRV(array)) == SVt_PVAV)
    {
      av = (AV*) SvRV(array);
      count = av_len(av)+1;
      Newx(intarray, count, int);
      for(i=0,ret=0; i<count; i++)
      {
        intarray[i] = SvIV(*av_fetch(av, i, 1));
      }
    }
    else
      intarray = NULL;
      
    RETVAL = test5(length, intarray);
    
    if(intarray != NULL)
    {
      for(i=0,ret=0; i<count; i++)
      {
        tmp = *av_fetch(av, i, 1);
        if(!SvREADONLY(tmp))
          sv_setiv(tmp, intarray[i]);
      }
      Safefree(intarray);
    }
  OUTPUT:
    RETVAL
