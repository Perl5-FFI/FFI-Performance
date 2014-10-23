all: libfoo.so

libfoo.so: foo.o
	gcc -shared -o libfoo.so foo.o

foo.o: foo.c foo.h
	gcc -c foo.c

clean:
	rm -f foo.o libfoo.so
