CFLAGS = -dynamiclib -framework AppKit -framework Foundation

all:
	$(CC) $(CFLAGS) main.m -o libpatch.dylib

clean:
	rm -rf *.o libpatch.dylib

build: all
	../../generate.sh
