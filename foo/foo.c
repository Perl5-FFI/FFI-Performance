#include "foo.h"

int
test1(int input)
{
  return input;
}

const char *
test2(const char *input)
{
  return input;
}

int
test3(int in1, int in2, int in3, int in4, int in5, int in6, int in7, int in8, int in9, int in10)
{
  return in1 + in2 + in3 + in4 + in5 + in6 + in7 + in8 + in9 + in10;
}

int
test4(int *ptr1, int *ptr2)
{
  (*ptr1)++;
  (*ptr2)++;
  return (*ptr1) + (*ptr2);
}

int
test5(int size, int *a)
{
  int i,ret;
  for(i=0,ret=0; i<size; i++)
    ret += a[i];
  return ret;
}
