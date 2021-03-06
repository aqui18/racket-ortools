
CC=clang
LIBS=-lortools
LDFLAGS=-L./extern/or-tools/lib
INCLUDE=-I./extern/or-tools/include
OPTS=-undefined dynamic_lookup -shared -fpic -std=c++11 -rpath $(PWD)/extern/or-tools/lib

extern/cwrapper.o: private/cwrapper.cpp
	$(CC) -std=c++11 -c $(INCLUDE) $(LDFLAGS) $(LIBS) $^ -o extern/cwrapper.o

extern/libcwrapper.dylib: extern/cwrapper.o
	$(CC) $(OPTS) $(INCLUDE) $(LDFLAGS) $(LIBS) $^ -o extern/libcwrapper.dylib 

clean: 
	rm -f extern/cwrapper.o extern/libcwrapper.dylib

