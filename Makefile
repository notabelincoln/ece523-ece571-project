CC := gcc
SRC := main.c fixed-point-5-11.c abe-math.c
CFLAGS += -Wall
LFLAGS := -lm
OUTPUT := run-test
all:
	$(CC) -o $(OUTPUT) $(CFLAGS) $(SRC) $(LFLAGS)
