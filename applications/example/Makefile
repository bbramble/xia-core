include ../../xia.mk

.PHONY: clean

LDFLAGS += $(LIBS)
#CFLAGS += -std=c++0x

TARGETS= chunk_copy_client chunk_copy_server echoclient echoclient-datagram \
	echoclient-simple echoserver time_of_day_client time_of_day_server

all: $(TARGETS)
	make -C dag_manipulation

%: %.c
	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS) -lpthread

%: %.cpp
	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS) -lpthread

clean: 
	-rm $(TARGETS)
	make -C dag_manipulation clean
