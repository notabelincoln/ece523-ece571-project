CC := gcc
CFLAGS += -Wall
LFLAGS := -lm
OUTPUT := run-test
all:
	$(CC) -o $(OUTPUT)-float $(CFLAGS) main.c abe-math.c $(LFLAGS)
