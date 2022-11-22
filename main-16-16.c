/* Abe Jordan
 * ECE 523 / ECE 571
 * Project
 * main.c
 */

#include <stdio.h>
#include <math.h>
#include <string.h>

#include "abe-math.h"

int main(int argc, char **argv)
{
	int i;
	int function;
	int display;

	double x;
	double x_min;
	double x_max;
	double x_step;
	double (*f)(double);

	/* check that user specifies function */
	if ((argc < 2) || (argc > 3)) {
		printf("USAGE: run-test [function] [display]\n");
		return -1;
	}

	/* determine what function user wants to compute */
	if (strcmp(argv[1], "sin") == 0) {
		function = 0;
		f = &sin_taylor;
		x_min = -2 * M_PI;
		x_max = 2 * M_PI;
		x_step = 0.00000001;
	} else {
		function = 1;
	}

	/* determine whether to display data */
	if (argc == 3) {
		if (strcmp(argv[2], "display") == 0) {
			display = 1;
		} else {
			display = 0;
		}
	}
	if (display == 1) {
		for (x = x_min; x <= x_max; x += x_step)
			printf("%10.7lf, %20.17lf\n", x, (*f)(x));
	} else {
		for (x = x_min; x <= x_max; x += x_step)
			(*f)(x);
	}

	printf("Completed\n");

	return 0;
}


