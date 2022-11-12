CC := gcc
SRC := main.c fixed-point-5-11.c
CFLAGS += -Wall
LFLAGS := -lm
OUTPUT := run-test
all:
	$(CC) -o $(OUTPUT) $(CFLAGS) $(SRC) $(LFLAGS)
