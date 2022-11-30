CC := gcc
CFLAGS += -Wall
LFLAGS := -lm
OUTPUT := test
OFTYPE := bin

.PHONY: all
all: float double fx5pt11 fx16pt16 fx32pt32 vals

float:
	$(CC) -o $(OUTPUT)-float.$(OFTYPE) $(CFLAGS) main-float.c abe-math-float.c $(LFLAGS)

double:
	$(CC) -o $(OUTPUT)-double.$(OFTYPE) $(CFLAGS) main-double.c abe-math-double.c $(LFLAGS)

fx5pt11:
	$(CC) -o $(OUTPUT)-05-11.$(OFTYPE) $(CFLAGS) main-5-11.c fixed-point-5-11.c $(LFLAGS)

fx16pt16:
	$(CC) -o $(OUTPUT)-16-16.$(OFTYPE) $(CFLAGS) main-16-16.c fixed-point-16-16.c $(LFLAGS)

fx32pt32:
	$(CC) -o $(OUTPUT)-32-32.$(OFTYPE) $(CFLAGS) main-32-32.c fixed-point-32-32.c $(LFLAGS)

vals:
	$(CC) -o print-values.$(OFTYPE) $(CFLAGS) main-print-values.c $(LFLAGS)

.PHONY: clean
clean:
	rm -f *.$(OFTYPE)

