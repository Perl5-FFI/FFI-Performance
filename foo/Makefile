all: libfoo.so libfoo.a

libfoo.a: foo.o
	ar -cvq libfoo.a foo.o
	ranlib libfoo.a
	rm -f libfoostatic.a
	cp libfoo.a libfoostatic.a

libfoo.so: foo.o
	gcc -shared -o libfoo.so foo.o

foo.o: foo.c foo.h
	gcc -c foo.c

clean:
	rm -f foo.o libfoo.so libfoo.a libfoostatic.a
