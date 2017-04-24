CFLAGS = -Wall -Wextra -levent
CXXFLAGS = $(CFLAGS)

GCC=gcc $(CFLAGS) -ggdb -pthread
GCCSO=$(GCC) -fPIC -shared
CPP=g++ $(CXXFLAGS) -ggdb -pthread
CPPSO=$(CPP) -fPIC -shared

EXEC=tcp-event tcp-event.so

all: $(EXEC)

.PHONY: module
module: all

clean:
	/bin/rm -f $(EXEC)

tcp-event: tcp-event.c
	$(CPP) -o $@ $<
tcp-event.so: tcp-event.c
	$(CPPSO) -o $@ $<
