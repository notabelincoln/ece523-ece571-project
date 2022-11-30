/* Abe Jordan
 * ECE 523 / ECE 571
 * Project
 * main-5-11.c
 */

#include <stdio.h>
#include <math.h>
#include <string.h>

#include "fixed-point-5-11.h"

int main(int argc, char **argv)
{
	int i;
	int function;
	int display;

	double x;

	display = 0;

	/* check if user called program only */
	if (argc == 1) {
		printf("USAGE: run-test-double [OPTIONS]\n");
		return -1;
	}

	/* determine the function the user wants */
	for (i = 1; i < argc; i++) {
		if (strncmp(argv[i], "sin", 256) == 0) {
			function = 0;
			break;
		}
	}

	/* determine whether to display the output */
	for (i = 1; i < argc; i++) {
		if (strncmp(argv[i], "display", 256) == 0) {
			display = 1;
			break;
		}
	}

	if (display == 0) {
		switch (function) {
		case (0):
			for (x = -(2 * M_PI); x <= (2 * M_PI); x += 0.0000001)
				sin_fixed(double_to_fixed(x));
			break;
		}
	} else {
		switch (function) {
		case (0):
			printf("%11.7s,%10.7s\n","x","sin_taylor");
			for (x = -(2 * M_PI); x <= (2 * M_PI); x += 0.0000001)
				printf("%11.7lf,%10.7lf\n",
						x,(double)sin_fixed(double_to_fixed(x)) / ((fixed_pt)1 << 11));
			break;
		}
	}

	return 0;
}


